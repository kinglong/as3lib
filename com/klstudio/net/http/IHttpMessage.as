package com.klstudio.net.http {

	/**
	 * An HTTP message
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public interface IHttpMessage {
		/**
		 * Returns the header value with the specified header name.  If there are
		 * more than one header value for the specified header name, the first
		 * value is returned.
		 *
		 * @return the header value or {@code null} if there is no such header
		 *
		 */
		function getHeader(name : String) : String;

		/**
		 * Returns the header values with the specified header name.
		 *
		 * @return the {@link List} of header values.  An empty list if there is no
		 *         such header.
		 */
		function getHeaders(name : String) : Array;

		/**
		 * Returns {@code true} if and only if there is a header with the specified
		 * header name.
		 */
		function containsHeader(name : String) : Boolean;

		/**
		 * Returns the {@link Set} of all header names that this message contains.
		 */
		function getHeaderNames() : Array;

		/**
		 * Returns the protocol version of this message.
		 */
		function getProtocolVersion() : HttpVersion;

		/**
		 * Returns the content of this message.  If there is no content, an
		 * {@link ChannelBuffers#EMPTY_BUFFER} is returned.
		 */
		function getContent() : *;

		/**
		 * Sets the content of this message.  If {@code null} is specified,
		 * the content of this message will be set to {@link ChannelBuffers#EMPTY_BUFFER}.
		 */
		function setContent(content : *) : void;

		/**
		 * Adds a new header with the specified name and value.
		 */
		function addHeader(name : String,value : String) : void;

		/**
		 * Sets a new header with the specified name and value.  If there is an
		 * existing header with the same name, the existing header is removed.
		 */
		function setHeader(name : String, value : *) : void;

		/**
		 * Removes the header with the specified name.
		 */
		function removeHeader(name : String) : void;

		/**
		 * Removes all headers from this message.
		 */
		function clearHeaders() : void;

		/**
		 * Returns the length of the content.  Please note that this value is
		 * not retrieved from {@link #getContent()} but from the
		 * {@code "Content-Length"} header, and thus they are independent from each
		 * other.
		 *
		 * @return the content length or {@code defaultValue} if this message does
		 *         not have the {@code "Content-Length"} header
		 */
		function getContentLength(defaultValue : uint = 0) : uint;

		/**
		 * Returns {@code true} if and only if the {@code "Transfer-Encoding"} of
		 * this message is {@code "chunked"}.
		 */
		function isChunked() : Boolean;

		/**
		 * Returns {@code true} if and only if the connection can remain open and
		 * thus 'kept alive'.
		 */
		function isKeepAlive() : Boolean;
	}
}
