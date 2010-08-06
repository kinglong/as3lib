package com.klstudio.net.http {

	/**
	 * The response code and its description of HTTP
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public class HttpResponseStatus {

		/**
		 * 100 Continue
		 */
		public static const CONTINUE : HttpResponseStatus = new HttpResponseStatus(100, "Continue");

		/**
		 * 101 Switching Protocols
		 */
		public static const SWITCHING_PROTOCOLS : HttpResponseStatus = new HttpResponseStatus(101, "Switching Protocols");

		/**
		 * 200 OK
		 */
		public static const OK : HttpResponseStatus = new HttpResponseStatus(200, "OK");

		/**
		 * 201 Created
		 */
		public static const CREATED : HttpResponseStatus = new HttpResponseStatus(201, "Created");

		/**
		 * 202 Accepted
		 */
		public static const ACCEPTED : HttpResponseStatus = new HttpResponseStatus(202, "Accepted");

		/**
		 * 203 Non-Authoritative Information
		 */
		public static const NON_AUTHORITATIVE_INFORMATION : HttpResponseStatus = new HttpResponseStatus(203, "Non-Authoritative Information");

		/**
		 * 204 No Content
		 */
		public static const NO_CONTENT : HttpResponseStatus = new HttpResponseStatus(204, "No Content");

		/**
		 * 205 Reset Content
		 */
		public static const RESET_CONTENT : HttpResponseStatus = new HttpResponseStatus(205, "Reset Content");

		/**
		 * 206 Partial Content
		 */
		public static const PARTIAL_CONTENT : HttpResponseStatus = new HttpResponseStatus(206, "Partial Content");

		/**
		 * 300 Multiple Choices
		 */
		public static const MULTIPLE_CHOICES : HttpResponseStatus = new HttpResponseStatus(300, "Multiple Choices");

		/**
		 * 301 Moved Permanently
		 */
		public static const MOVED_PERMANENTLY : HttpResponseStatus = new HttpResponseStatus(301, "Moved Permanently");

		/**
		 * 302 Found
		 */
		public static const FOUND : HttpResponseStatus = new HttpResponseStatus(302, "Found");

		/**
		 * 303 See Other
		 */
		public static const SEE_OTHER : HttpResponseStatus = new HttpResponseStatus(303, "See Other");

		/**
		 * 304 Not Modified
		 */
		public static const NOT_MODIFIED : HttpResponseStatus = new HttpResponseStatus(304, "Not Modified");

		/**
		 * 305 Use Proxy
		 */
		public static const USE_PROXY : HttpResponseStatus = new HttpResponseStatus(305, "Use Proxy");

		/**
		 * 307 Temporary Redirect
		 */
		public static const TEMPORARY_REDIRECT : HttpResponseStatus = new HttpResponseStatus(307, "Temporary Redirect");

		/**
		 * 400 Bad Request
		 */
		public static const BAD_REQUEST : HttpResponseStatus = new HttpResponseStatus(400, "Bad Request");

		/**
		 * 401 Unauthorized
		 */
		public static const UNUATHORIZED : HttpResponseStatus = new HttpResponseStatus(401, "Unauthorized");

		/**
		 * 402 Payment Required
		 */
		public static const PAYMENT_REQUIRED : HttpResponseStatus = new HttpResponseStatus(402, "Payment Required");

		/**
		 * 403 Forbidden
		 */
		public static const FORBIDDEN : HttpResponseStatus = new HttpResponseStatus(403, "Forbidden");

		/**
		 * 404 Not Found
		 */
		public static const NOT_FOUND : HttpResponseStatus = new HttpResponseStatus(404, "Not Found");

		/**
		 * 405 Method Not Allowed
		 */
		public static const METHOD_NOT_ALLOWED : HttpResponseStatus = new HttpResponseStatus(405, "Method Not Allowed");

		/**
		 * 406 Not Acceptable
		 */
		public static const NOT_ACCEPTABLE : HttpResponseStatus = new HttpResponseStatus(406, "Not Acceptable");

		/**
		 * 407 Proxy Authentication Required
		 */
		public static const PROXY_AUTHENTICATION_REQUIRED : HttpResponseStatus = new HttpResponseStatus(407, "Proxy Authentication Required");

		/**
		 * 408 Request Timeout
		 */
		public static const REQUEST_TIMEOUT : HttpResponseStatus = new HttpResponseStatus(408, "Request Timeout");

		/**
		 * 409 Conflict
		 */
		public static const CONFLICT : HttpResponseStatus = new HttpResponseStatus(409, "Conflict");

		/**
		 * 410 Gone
		 */
		public static const GONE : HttpResponseStatus = new HttpResponseStatus(410, "Gone");

		/**
		 * 411 Length Required
		 */
		public static const LENGTH_REQUIRED : HttpResponseStatus = new HttpResponseStatus(411, "Length Required");

		/**
		 * 412 Precondition Failed
		 */
		public static const PRECONDITION_FAILED : HttpResponseStatus = new HttpResponseStatus(412, "Precondition Failed");

		/**
		 * 413 Request Entity Too Large
		 */
		public static const REQUEST_ENTITY_TOO_LARGE : HttpResponseStatus = new HttpResponseStatus(413, "Request Entity Too Large");

		/**
		 * 414 Request-URI Too Long
		 */
		public static const REQUEST_URI_TOO_LONG : HttpResponseStatus = new HttpResponseStatus(414, "Request-URI Too Long");

		/**
		 * 415 Unsupported Media Type
		 */
		public static const UNSUPPORTED_MEDIA_TYPE : HttpResponseStatus = new HttpResponseStatus(415, "Unsupported Media Type");

		/**
		 * 416 Requested Range Not Satisfiable
		 */
		public static const REQUESTED_RANGE_NOT_SATISFIABLE : HttpResponseStatus = new HttpResponseStatus(416, "Requested Range Not Satisfiable");

		/**
		 * 417 Expectation Failed
		 */
		public static const EXPECTATION_FAILED : HttpResponseStatus = new HttpResponseStatus(417, "Expectation Failed");

		/**
		 * 500 Internal Server Error
		 */
		public static const INTERNAL_SERVER_ERROR : HttpResponseStatus = new HttpResponseStatus(500, "Internal Server Error");

		/**
		 * 501 Not Implemented
		 */
		public static const NOT_IMPLEMENTED : HttpResponseStatus = new HttpResponseStatus(501, "Not Implemented");

		/**
		 * 502 Bad Gateway
		 */
		public static const BAD_GATEWAY : HttpResponseStatus = new HttpResponseStatus(502, "Bad Gateway");

		/**
		 * 503 Service Unavailable
		 */
		public static const SERVICE_UNAVAILABLE : HttpResponseStatus = new HttpResponseStatus(503, "Service Unavailable");

		/**
		 * 504 Gateway Timeout
		 */
		public static const GATEWAY_TIMEOUT : HttpResponseStatus = new HttpResponseStatus(504, "Gateway Timeout");

		/**
		 * 505 HTTP Version Not Supported
		 */
		public static const HTTP_VERSION_NOT_SUPPORTED : HttpResponseStatus = new HttpResponseStatus(505, "HTTP Version Not Supported");

		public function valueOf(code : uint) : HttpResponseStatus {
			switch (code) {
				case 100:
					return CONTINUE;
				case 101:
					return SWITCHING_PROTOCOLS;
				case 200:
					return OK;
				case 201:
					return CREATED;
				case 202:
					return ACCEPTED;
				case 203:
					return NON_AUTHORITATIVE_INFORMATION;
				case 204:
					return NO_CONTENT;
				case 205:
					return RESET_CONTENT;
				case 206:
					return PARTIAL_CONTENT;
				case 300:
					return MULTIPLE_CHOICES;
				case 301:
					return MOVED_PERMANENTLY;
				case 302:
					return FOUND;
				case 303:
					return SEE_OTHER;
				case 304:
					return NOT_MODIFIED;
				case 305:
					return USE_PROXY;
				case 307:
					return TEMPORARY_REDIRECT;
				case 400:
					return BAD_REQUEST;
				case 401:
					return UNUATHORIZED;
				case 402:
					return PAYMENT_REQUIRED;
				case 403:
					return FORBIDDEN;
				case 404:
					return NOT_FOUND;
				case 405:
					return METHOD_NOT_ALLOWED;
				case 406:
					return NOT_ACCEPTABLE;
				case 407:
					return PROXY_AUTHENTICATION_REQUIRED;
				case 408:
					return REQUEST_TIMEOUT;
				case 409:
					return CONFLICT;
				case 410:
					return GONE;
				case 411:
					return LENGTH_REQUIRED;
				case 412:
					return PRECONDITION_FAILED;
				case 413:
					return REQUEST_ENTITY_TOO_LARGE;
				case 414:
					return REQUEST_URI_TOO_LONG;
				case 415:
					return UNSUPPORTED_MEDIA_TYPE;
				case 416:
					return REQUESTED_RANGE_NOT_SATISFIABLE;
				case 417:
					return EXPECTATION_FAILED;
				case 500:
					return INTERNAL_SERVER_ERROR;
				case 501:
					return NOT_IMPLEMENTED;
				case 502:
					return BAD_GATEWAY;
				case 503:
					return SERVICE_UNAVAILABLE;
				case 504:
					return GATEWAY_TIMEOUT;
				case 505:
					return HTTP_VERSION_NOT_SUPPORTED;
			}

			var reasonPhrase : String;

			if (code < 100) {
				reasonPhrase = "Unknown Status";
			} else if (code < 200) {
				reasonPhrase = "Informational";
			} else if (code < 300) {
				reasonPhrase = "Successful";
			} else if (code < 400) {
				reasonPhrase = "Redirection";
			} else if (code < 500) {
				reasonPhrase = "Client Error";
			} else if (code < 600) {
				reasonPhrase = "Server Error";
			} else {
				reasonPhrase = "Unknown Status";
			}

			return new HttpResponseStatus(code, reasonPhrase + " (" + code + ')');
		}

		private var _code : uint;
		private var _reasonPhrase : String;

		public function HttpResponseStatus(code : uint,reasonPhrase : String) {
			_code = code;
			_reasonPhrase = reasonPhrase;
		}

		public function get code() : uint {
			return _code;
		}

		public function get reasonPhrase() : String {
			return _reasonPhrase;
		}

		public function equals(o : *) : Boolean {
			if(o is HttpResponseStatus) {
				var that : HttpResponseStatus = o as HttpResponseStatus;
				return that.code == this.code; 
			} else {
				return false;
			}
		}

		public function toString() : String {
			return "[HttpResponseStatus code=" + code + ",reasonPhrase=" + reasonPhrase + "]";
		}
	}
}
