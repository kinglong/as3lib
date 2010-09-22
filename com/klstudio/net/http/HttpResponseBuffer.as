package com.klstudio.net.http {
	import com.klstudio.utils.StringUtil;
	import flash.utils.ByteArray;

	/**
	 * HttpResponseBuffer
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-7
	 */	

	public class HttpResponseBuffer {
		// Notified when response is complete: function(response:HttpResponse):void { }
		private var _onResponseComplete : Function;
		// If we expect response body
		private var _hasResponseBody : Boolean;
		// Response header data parsed from bytes
		private var _headerData : Array;
		// Bytes read of body content
		private var _bodyBytesRead : uint;
		private var _response : HttpResponse;
		// For special transfer encodings (like Chunks); Typically data is streamed directly
		private var _responseBody : HttpBuffer;
		// If response buffer is done
		private var _isPayloadDone : Boolean ;
		// Data buffer
		private var _buffer : HttpBuffer;

		public function HttpResponseBuffer(hasResponseBody : Boolean,onResponseComplete : Function) {
			init();
			_hasResponseBody = hasResponseBody;
			_onResponseComplete = onResponseComplete;
		}

		private function init() : void {			
			_buffer = new HttpBuffer();
			_responseBody = new HttpBuffer();
			_bodyBytesRead = 0;
			_headerData = [];
			_isPayloadDone = false;
			_response = null;
		}

		public function writeBytes(bytes : ByteArray) : void {
			if(_isPayloadDone) return;
			_buffer.write(bytes);
			if (_response) {
				_isPayloadDone = handlePayload(_buffer.readAvailable());				
			}else{
				var line : String = _buffer.readLine(true);
				while(line != null) {
					if(line.length == 0) {
						_response = parseHeader(_headerData); 
						if(_response.status.equals(HttpResponseStatus.CONTINUE)) {
							_buffer.truncate();
							_isPayloadDone = false;
						}else if(_response.status.equals(HttpResponseStatus.NO_CONTENT)) {
							_hasResponseBody = false;
						} else {
							//Pass any extra as payload
							_isPayloadDone = handlePayload(_buffer.readAvailable());							
							break;
						}
					} else {
						_headerData.push(line);
					}
					line = _buffer.readLine(true);
				}
			}
			if (!_hasResponseBody || _isPayloadDone) {				
				_onResponseComplete(_response);
				init();
			}
		}

		private function handlePayload(bytes : ByteArray) : Boolean {
			if(_response.isChunked()) {
				_responseBody.write(bytes);
				_bodyBytesRead += bytes.length;				
				var res:Boolean = _responseBody.readChunks(onResponseData);
				return res;
			} else {
				if(bytes.bytesAvailable > 0) {
					onResponseData(bytes);
					_bodyBytesRead += bytes.length;
				}
				return  _response.getContentLength() > 0 && _bodyBytesRead >= _response.getContentLength();
			}			 
		}

		private function onResponseData(bytes : ByteArray) : void {
			var content : ByteArray = _response.getContent();
			if(content == null) {
				content = new ByteArray();
			}
			content.writeBytes(bytes);
			content.position = 0;
			_response.setContent(content);
		}

		protected function parseHeader(lines : Array) : HttpResponse {
			var line : String = lines[0];
			// Example, HTTP/1.1 200 OK      
			var matches : Array = line.match(/(\S+)\/(\d+)\.(\d+)\s+(\d\d\d)\s*(.*)\z/);
			if (!matches)  throw new VerifyError("Invalid header: " + line + ", matches: " + matches);
			var version : HttpVersion = new HttpVersion(matches[1], uint(matches[2]), uint(matches[3]));
			var status : HttpResponseStatus = new HttpResponseStatus(uint(matches[4]), matches[5]);
			var response : HttpResponse = new HttpResponse(version, status);
			for(var i : uint = 1;i < lines.length;i++) {
				line = lines[i];
				var index : int = line.indexOf(HttpCodecUtil.COLON);
				if(index != -1) {
					var name : String = line.substring(0, index);
					var value : String = line.substring(index + 1, line.length);
					response.addHeader(name, StringUtil.trim(value));
				}
			}
			return response;
		}
	}
}
