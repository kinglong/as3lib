package com.klstudio.net.http {
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * HttpMessage
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public class HttpMessage implements IHttpMessage {
		private static function validateHeaderName(name : String) : void {
			if(name == null) {
				throw new Error("name is null!");
			}
			for(var i : uint = 0;i < name.length;i++) {
				var n : Number = name.charCodeAt(i);
				if(n > 127) {
					throw new Error("name contains non-ascii character: " + name);
				}
				switch(n) {
					case 0x3d: 	//'='
					case 0x2c: 	//','
					case 0x3b: 	//';'
					case 0x20: 	//' '
					case 0x3a: 	//':'
					case 0x09: 	//'\t'
					case 0x0d: 	//'\r'
					case 0x0a: 	//'\n'
					case 0x0c: 	//'\f'
					case 0x0b: 	
						//Vertical tab
						throw new Error("name contains one of the following prohibited characters: " + "=,;: \\t\\r\\n\\v\\f: " + name);
				}
			}
		}

		private static function validateHeaderValue(value : String) : void {
			if(value == null) {
				throw new Error("value is null!");
			}
			for(var i : uint = 0;i < value.length;i++) {
				var n : Number = value.charCodeAt(i);
				switch(n) {
					case 0x0d: 	//'\r'
					case 0x0a: 	//'\n'
					case 0x0c: 	//'\f'
					case 0x0b: 	
						//Vertical tab
						throw new Error("value contains one of the following prohibited characters: " + "\\r\\n\\v\\f: " + value);
				}
			}
		}

		private var _version : HttpVersion;
		private var _headers : Dictionary = new Dictionary(true);
		private var _content : ByteArray;

		protected function HttpMessage(version : HttpVersion) {
			if(version == null) {
				throw new Error("version is null!");
			}
			_version = version;
		}

		public function addHeader(name : String,value : String) : void {
			validateHeaderName(name);
			validateHeaderValue(value);
			var values : Array = _headers[name];
			if(values == null) {
				values = new Array();
			}
			values.push(value);
			_headers[name] = values;
		}

		public function setHeader(name : String,value : *) : void {
			validateHeaderName(name);
			if(value == null) {
				throw new Error("value is null!");
			}
			var values : Array = new Array();
			if(value is Array) {
				var c : uint = 0;
				for each (var v : String in value) {
					validateHeaderValue(v);
					values.push(v);
					c++;
				}
				if(c == 0) {
					throw new Error("[Array]value is empty!");
				}
			}else if(value is String || value is Number || value is int || value is uint) {
				validateHeaderValue(value + "");
				values.push(value + "");
			} else {
				throw new Error("invalid value format:" + typeof(value));
			}
			_headers[name] = values;
		}

		public function getHeader(name : String) : String {			
			var values : Array = _headers[name];
			return values == null || values.length == 0 ? null : values[0];
		}

		public function getHeaders(name : String) : Array {
			var values : Array = _headers[name];
			if(values == null) {
				return new Array();
			} else {
				return values;
			}
		}

		public function removeHeader(name : String) : void {
			delete _headers[name];
		}

		public function containsHeader(name : String) : Boolean {
			// TODO: Auto-generated method stub
			var values : Array = _headers[name];
			return values != null;
		}

		public function getHeaderNames() : Array {
			// TODO: Auto-generated method stub
			var names : Array = new Array();
			for(var name:String in _headers) {
				names.push(name);
			}
			return names;
		}

		public function getProtocolVersion() : HttpVersion {
			// TODO: Auto-generated method stub
			return _version;
		}

		public function clearHeaders() : void {
			_headers = new Dictionary(true);
		}

		public function getContentLength(defaultValue : uint = 0) : uint {
			// TODO: Auto-generated method stub
			var values : Array = _headers[HttpHeaders.Names.CONTENT_LENGTH];
			if (values == null || values.length == 0) {
				return defaultValue;
			} else {
				return uint(values[0]);
			}
		}

		public function isChunked() : Boolean {
			// TODO: Auto-generated method stub
			var values : Array = _headers[HttpHeaders.Names.TRANSFER_ENCODING];
			if (values == null || values.length == 0) {
				return false;
			}
			for each (var value : String in values) {
				if(value.toLowerCase() == HttpHeaders.Values.CHUNKED.toLowerCase()) {
					return true;
				}
			}
			return false;			
		}

		public function isKeepAlive() : Boolean {
			// TODO: Auto-generated method stub
			var value : String = getHeader(HttpHeaders.Names.CONNECTION);
			if(value == null) {
				value = "";
			} else {
				value == value.toLowerCase();
			}
			if(HttpHeaders.Values.CLOSE.toLowerCase() == value) {
				return false;
			}
			if(getProtocolVersion().equals(HttpVersion.HTTP_1_0) && HttpHeaders.Values.KEEP_ALIVE != value) {
				return false;
			}
			return true;
		}

		public function getContent() : * {
			return _content;
		}

		public function setContent(content : *) : void {
			_content = content;
		}		
	}
}
