package com.klstudio.net.http {
	import flash.utils.ByteArray;

	/**
	 * HttpRequestBuffer
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-10
	 */
	public class HttpRequestBuffer {
		private static const BLOCK_SIZE : uint = 16 * 1024;

		private var _content : ByteArray;
		private var _bytesSent : uint = 0;

		public function HttpRequestBuffer(content : ByteArray) {
			_content = content;			
		}

		public function get bytesSent() : uint {
			return _bytesSent;
		}

		public function get hasData() : Boolean {
			if(!_content) return false;
			return _bytesSent < _content.length;
		}

		public function read() : ByteArray {
			var bytes : ByteArray = new ByteArray();
			if (_content.bytesAvailable > 0) {
				var len : uint = Math.min(BLOCK_SIZE, _content.bytesAvailable);
				_content.readBytes(bytes, 0, len);      
				bytes.position = 0;
				_bytesSent += bytes.length;        
			}
			return bytes;
		}
	}
}
