package com.klstudio.net.http {

	/**
	 * HttpResponse
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */	

	public class HttpResponse extends HttpMessage implements IHttpResponse {
		private var _status : HttpResponseStatus;

		/**
		 * Creates a new instance.
		 *
		 * @param version the HTTP version of this response
		 * @param status  the status of this response
		 */
		public function HttpResponse(version : HttpVersion,status : HttpResponseStatus) {
			super(version);
			if(status == null) {
				throw new ArgumentError("status is null!");
			}
			_status = status;
		}

		public function get status() : HttpResponseStatus {
			// TODO: Auto-generated method stub
			return _status;
		}
	}
}
