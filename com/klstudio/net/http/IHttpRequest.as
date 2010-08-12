package com.klstudio.net.http {
	import flash.utils.ByteArray;
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
		function get method() : HttpMethod;
		
		/**
		 * Returns the URI (or path) of this request.
		 */
		function get uri() : String;
		
		function set uri(value:String):void;
		
		function get headBytes():ByteArray;
	}
}
