package com.klstudio.net.http {
	import com.klstudio.net.http.IHttpMessage;

	/**
	 * An HTTP response.
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public interface IHttpResponse extends IHttpMessage {
		function getStatus():HttpResponseStatus;
	}
}
