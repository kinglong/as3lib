package com.klstudio.net.http {
	import com.klstudio.net.http.IHttpMessage;

	/**
	 * An HTTP request.
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public interface IHttpRequest extends IHttpMessage {
		/**
		 * Returns the method of this request.
		 */
		function getMethod() : HttpMethod;

		/**
		 * Returns the URI (or path) of this request.
		 */
		function getUri() : String;
	}
}
