package com.klstudio.net.http {

	/**
	 * An HTTP chunk which is used for HTTP chunked transfer-encoding.
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-12
	 */
	public interface IHttpChunk {
		function isLast():Boolean;
		function getContent():HttpBuffer;
		function setContent(content:HttpBuffer):void
	}
}
