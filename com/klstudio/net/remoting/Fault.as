package com.klstudio.net.remoting {

	/**
	 * Fault
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-3
	 */
	public class Fault extends Error {
		public var rootCause : Object;
		public var content : Object;

		protected var _faultCode : String;
		protected var _faultString : String;        
		protected var _faultDetail : String;

		public function Fault(faultCode : String, faultString : String, faultDetail : String = null) {
			super("faultCode:" + faultCode + " faultString:\'" + faultString + "\' faultDetail:\'" + faultDetail + "\'");
			_faultCode = faultCode;
			_faultString = faultString ? (faultString) : ("");
			_faultDetail = faultDetail;
		}

		public function get faultString() : String {
			return _faultString;
		}

		public function toString() : String {
			var str : String = "[Fault";
			str = str + (" faultString=\"" + faultString + "\"");
			str = str + (" faultCode=\"" + faultCode + "\"");
			str = str + (" faultDetail=\"" + faultDetail + "\"]");
			return str;
		}

		public function get faultCode() : String {
			return _faultCode;
		}

		public function get faultDetail() : String {
			return _faultDetail;
		}
	}
}
