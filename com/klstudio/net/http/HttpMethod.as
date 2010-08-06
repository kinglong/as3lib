package com.klstudio.net.http {

	/**
	 * The request method of HTTP or its derived protocols
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public class HttpMethod {

		/**
		 * The OPTIONS method represents a request for information about the communication options available on the request/response
		 * chain identified by the Request-URI. This method allows the client to determine the options and/or requirements
		 * associated with a resource, or the capabilities of a server, without implying a resource action or initiating a
		 * resource retrieval.
		 */
		public static const OPTIONS : HttpMethod = new HttpMethod("OPTIONS");

		/**
		 * The GET method means retrieve whatever information (in the form of an entity) is identified by the Request-URI.
		 * If the Request-URI refers to a data-producing process, it is the produced data which shall be returned as the entity
		 * in the response and not the source text of the process, unless that text happens to be the output of the process.
		 */
		public static const GET : HttpMethod = new HttpMethod("GET");

		/**
		 * The HEAD method is identical to GET except that the server MUST NOT return a message-body in the response.
		 */
		public static const HEAD : HttpMethod = new HttpMethod("HEAD");

		/**
		 * The POST method is used to request that the origin server accept the entity enclosed in the request as a new
		 * subordinate of the resource identified by the Request-URI in the Request-Line.
		 */
		public static const POST : HttpMethod = new HttpMethod("POST");

		/**
		 * The PUT method requests that the enclosed entity be stored under the supplied Request-URI.
		 */
		public static const PUT : HttpMethod = new HttpMethod("PUT");

		/**
		 * The DELETE method requests that the origin server delete the resource identified by the Request-URI.
		 */
		public static const DELETE : HttpMethod = new HttpMethod("DELETE");

		/**
		 * The TRACE method is used to invoke a remote, application-layer loop- back of the request message.
		 */
		public static const TRACE : HttpMethod = new HttpMethod("TRACE");

		/**
		 * This specification reserves the method name CONNECT for use with a proxy that can dynamically switch to being a tunnel
		 */
		public static const CONNECT : HttpMethod = new HttpMethod("CONNECT");

		private var _name : String;

		public function HttpMethod(name : String) {
			if(name == null) {
				new Error("name is null!");
			}
			name = HttpVersion.trim(name).toUpperCase();
			if(name.length == 0) {
				new Error("name is empty!");
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
			_name = name;
		}

		public function get name() : String {
			return _name;
		}

		public function equals(o : *) : Boolean {
			if(o is HttpMethod) {
				var that : HttpMethod = o as HttpMethod;
				return that.name == this.name;
			} else {
				return false;
			}
		}
	}
}
