package com.klstudio.net.http {

	/**
	 * Standard HTTP header values.
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-7
	 */	

	public class HttpHeaderValues {
		/**
		 * value "base64"
		 */
		public const BASE64 : String = "base64";
		/**
		 * value "binary"
		 */
		public const BINARY : String = "binary";
		/**
		 * value "bytes"
		 */
		public const BYTES : String = "bytes";
		/**
		 * value "charset"
		 */
		public const CHARSET : String = "charset";
		/**
		 * value "chunked"
		 */
		public const CHUNKED : String = "chunked";
		/**
		 * value "close"
		 */
		public const CLOSE : String = "close";
		/**
		 * value "compress"
		 */
		public const COMPRESS : String = "compress";
		/**
		 * value "100-continue"
		 */
		public const CONTINUE : String = "100-continue";
		/**
		 * value "deflate"
		 */
		public const DEFLATE : String = "deflate";
		/**
		 * value "gzip"
		 */
		public const GZIP : String = "gzip";
		/**
		 * value "identity"
		 */
		public const IDENTITY : String = "identity";
		/**
		 * value "keep-alive"
		 */
		public const KEEP_ALIVE : String = "keep-alive";
		/**
		 * value "max-age"
		 */
		public const MAX_AGE : String = "max-age";
		/**
		 * value "max-fresh"
		 */
		public const MAX_FRESH : String = "max-fresh";
		/**
		 * value "max-stale"
		 */
		public const MAX_STALE : String = "max-stale";
		/**
		 * value "must-revalidate"
		 */
		public const MUST_REVALIDATE : String = "must-revalidate";
		/**
		 * value "no-cache"
		 */
		public const NO_CACHE : String = "no-cache";
		/**
		 * value "no-store"
		 */
		public const NO_STORE : String = "no-store";
		/**
		 * value "no-transform"
		 */
		public const NO_TRANSFORM : String = "no-transform";
		/**
		 * value "none"
		 */
		public const NONE : String = "none";
		/**
		 * value "only-if-cached"
		 */
		public const ONLY_IF_CACHED : String = "only-if-cached";
		/**
		 * value "private"
		 */
		public const PRIVATE : String = "private";
		/**
		 * value "proxy-revalidate"
		 */
		public const PROXY_REVALIDATE : String = "proxy-revalidate";
		/**
		 * value "public"
		 */
		public const PUBLIC : String = "public";
		/**
		 * value "quoted-printable"
		 */
		public const QUOTED_PRINTABLE : String = "quoted-printable";
		/**
		 * value "s-maxage"
		 */
		public const S_MAXAGE : String = "s-maxage";
		/**
		 * value "trailers"
		 */
		public const TRAILERS : String = "trailers";
		/**
		 * value "application/octet-stream"
		 */     
		public const APPLICATION_OCTET_STREAM : String = "application/octet-stream";
		/**
		 * value "application/x-www-form-urlencoded"
		 */
		public const APPLICATION_X_WWW_FORM_URLENCODED : String = "application/x-www-form-urlencoded";
		/**
		 * value "application/x-amf"
		 */
		public const APPLICATION_AMF : String = "application/x-amf";
		/**
		 * value "image/jpeg"
		 */
		public const IMAGE_JPEG : String = "image/jpeg";
		/**
		 * value "image/gif"
		 */
		public const IMAGE_GIF : String = "image/gif";

		/**
		 * value "application/x-shockwave-flash"
		 */
		public const APPLICATION_SWF : String = "application/x-shockwave-flash";

		
		public function HttpHeaderValues() {
			super();
		}
	}
}
