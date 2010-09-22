package com.klstudio.net.http {
	import com.klstudio.utils.StringUtil;
	import flash.utils.ByteArray;

	/**
	 * HttpBuffer
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-10
	 */
	public class HttpBuffer {
		protected var _data : ByteArray = new ByteArray();
		protected var _cursor : uint = 0; // Read position
		protected var _chunkLength : uint = 0; // Last chunk length

		public function HttpBuffer() {	
			super();		
		}

		public function write(bytes : ByteArray) : void {
			_data.position = _data.length;
			_data.writeBytes(bytes);      
			_data.position = _cursor;
		}

		public function read(bytes : ByteArray) : void {
			_data.readBytes(bytes);
			_cursor = _data.position;      
		}

		public function get bytesAvailable() : uint {
			return _data.bytesAvailable;
		}

		public function readAvailable() : ByteArray {
			var bytes : ByteArray = new ByteArray();
			read(bytes);
			bytes.position = 0;
			return bytes;
		}

		public function readLine(trim : Boolean = false) : String {    
			if (_data.bytesAvailable == 0) return null;      
			var bytes : ByteArray = new ByteArray();
			var foundLine : Boolean = false;			      
			while(_data.bytesAvailable > 0) {
				var char : int = _data.readByte();
				bytes.writeByte(char);
				// Char code 10 == '\n'
				if (char == 10) {
					foundLine = true;
					break; 
				}
			}      
			var line : String = null;
			if (foundLine) {
				bytes.position = 0;
				line = bytes.readUTFBytes(bytes.length);                 
				_cursor = _data.position;
				return trim ? StringUtil.rtrim(line) : line;        
			} else {
				_data.position = _cursor;
				return null;
			}
		}

		public function truncate() : void {
			var nextData : ByteArray = new ByteArray();
			if (_data.bytesAvailable) _data.readBytes(nextData);
			_data = nextData;
			_cursor = 0;
		}

		public function readChunks(onData : Function) : Boolean {      
			while(_data.bytesAvailable > 0) {        
				if (_chunkLength == 0) { 
					var line : String = readLine();
					if (!line) throw new Error("No data available");          
					var match : Array = line.match(/\A([0-9a-fA-F]+).*/);
					if (!match) {
						throw new Error("Invalid chunk; trying to find chunk length at line: " + line);
					}

					var hexlen : String = match[1];
					var length : Number = parseInt(hexlen, 16);
					if (length <= 0) return true;
					_chunkLength = length;
				}
        
				if (_data.bytesAvailable >= (_chunkLength + 2)) {          
					var bytes : ByteArray = new ByteArray();  
					_data.readBytes(bytes, 0, _chunkLength);
					_data.position += 2; // Skip CRLF
					_cursor = _data.position;
					_chunkLength = 0;
					onData(bytes);          
				} else {
					// Back it up, copy the bytes subset into new array (to save memory) and break out
					truncate();
					return false;
				}
			}
      
			return false;
		}
	}
}
