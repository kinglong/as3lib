package com.klstudio.net.http {
	import flash.utils.ByteArray;

	/**
	 * HttpRequest
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */	

	public class HttpRequest extends HttpMessage implements IHttpRequest {
		private var _method : HttpMethod;
		private var _uri : String;

		/**
		 * Creates a new instance.
		 *
		 * @param httpVersion the HTTP version of the request
		 * @param method      the HTTP method of the request
		 * @param uri         the URI or path of the request
		 */
		public function HttpRequest(uri : String,method : HttpMethod = null,version : HttpVersion = null) {
			if(version == null) {
				version = HttpVersion.HTTP_1_1;
			}
			super(version);
			if(method == null) {
				_method = HttpMethod.GET;
			} else{
				_method = method;
			}
			if(uri == null) {
				throw new Error("uri is null!");
			}
			_uri = uri;
		}

		public function get method() : HttpMethod {
			// TODO: Auto-generated method stub
			return _method;
		}

		public function get uri() : String {
			// TODO: Auto-generated method stub
			return _uri;
		}	

		public function set uri(value : String) : void {
			_uri = value;	
		}

		public function toString() : String {
			return method.toString() + ' ' + uri + ' ' + getProtocolVersion().toString();
		}

		public function get headBytes() : ByteArray {
			// TODO: Auto-generated method stub
			var bytes : ByteArray = new ByteArray();
			encodeInitialLine(bytes);
			/*
			if(method.equals(HttpMethod.POST)) {
				setHeader(HttpHeaders.Names.CONTENT_TYPE, HttpHeaders.Values.APPLICATION_X_WWW_FORM_URLENCODED);
			} else {
				removeHeader(HttpHeaders.Names.CONTENT_TYPE);
			}			 
			 */
			var content : ByteArray = getContent();
			if(content) {
				setHeader(HttpHeaders.Names.CONTENT_LENGTH, content.length.toString());
			} else {
				setHeader(HttpHeaders.Names.CONTENT_LENGTH, "0");
			}
			encodeHeaders(bytes);
			bytes.writeUTFBytes(HttpCodecUtil.CRLF);
			bytes.position = 0;
			return bytes;
		}

		private function encodeInitialLine(bytes : ByteArray) : void {
			bytes.writeUTFBytes(method.toString());
			bytes.writeUTFBytes(HttpCodecUtil.SP);
			bytes.writeUTFBytes(uri);
			bytes.writeUTFBytes(HttpCodecUtil.SP);
			bytes.writeUTFBytes(getProtocolVersion().toString());
			bytes.writeUTFBytes(HttpCodecUtil.CRLF);
		}

		private function encodeHeaders(bytes : ByteArray) : void {
			var names : Array = getHeaderNames();
			for each (var name : String in names) {
				var values : Array = getHeaders(name);
				for each (var value : String in values) {
					bytes.writeUTFBytes(name);
					bytes.writeUTFBytes(HttpCodecUtil.COLON);
					bytes.writeUTFBytes(HttpCodecUtil.SP);
					bytes.writeUTFBytes(value);
					bytes.writeUTFBytes(HttpCodecUtil.CRLF);
				}
			}
		}
	}
}
