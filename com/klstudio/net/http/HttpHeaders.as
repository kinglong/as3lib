package com.klstudio.net.http {

	/**
	 * Standard HTTP header names and values.
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public final class HttpHeaders {
		public static const Names:HttpHeaderNames = new HttpHeaderNames();
		public static const Values:HttpHeaderValues = new HttpHeaderValues();
	}
}
/**
 * Standard HTTP header names.
 */
final class HttpHeaderNames {
	/**
     * name "Accept"
     */
    public const ACCEPT:String = "Accept";
    /**
     * name "Accept-Charset"
     */
    public const ACCEPT_CHARSET:String = "Accept-Charset";
    /**
     * name "Accept-Encoding"
     */
    public const ACCEPT_ENCODING:String = "Accept-Encoding";
    /**
     * name "Accept-Language"
     */
    public const ACCEPT_LANGUAGE:String = "Accept-Language";
    /**
     * name "Accept-Ranges"
     */
    public const ACCEPT_RANGES:String = "Accept-Ranges";
    /**
     * name "Age"
     */
    public const AGE:String = "Age";
    /**
     * name "Allow"
     */
    public const ALLOW:String = "Allow";
    /**
     * name "Authorization"
     */
    public const AUTHORIZATION:String = "Authorization";
    /**
     * name "Cache-Control"
     */
    public const CACHE_CONTROL:String = "Cache-Control";
    /**
     * name "Connection"
     */
    public const CONNECTION:String = "Connection";
    /**
     * name "Content-Encoding"
     */
    public const CONTENT_ENCODING:String = "Content-Encoding";
    /**
     * name "Content-Language"
     */
    public const CONTENT_LANGUAGE:String = "Content-Language";
    /**
     * name "Content-Length"
     */
    public const CONTENT_LENGTH:String = "Content-Length";
    /**
     * name "Content-Location"
     */
    public const CONTENT_LOCATION:String = "Content-Location";
    /**
     * name "Content-Transfer-Encoding"
     */
    public const CONTENT_TRANSFER_ENCODING:String = "Content-Transfer-Encoding";
    /**
     * name "Content-MD5"
     */
    public const CONTENT_MD5:String = "Content-MD5";
    /**
     * name "Content-Range"
     */
    public const CONTENT_RANGE:String = "Content-Range";
    /**
     * name "Content-Type"
     */
    public const CONTENT_TYPE:String = "Content-Type";
    /**
     * name "Cookie"
     */
    public const COOKIE:String = "Cookie";
    /**
     * name "Date"
     */
    public const DATE:String = "Date";
    /**
     * name "ETag"
     */
    public const ETAG:String = "ETag";
    /**
     * name "Expect"
     */
    public const EXPECT:String = "Expect";
    /**
     * name "Expires"
     */
    public const EXPIRES:String = "Expires";
    /**
     * name "From"
     */
    public const FROM:String = "From";
    /**
     * name "Host"
     */
    public const HOST:String = "Host";
    /**
     * name "If-Match"
     */
    public const IF_MATCH:String = "If-Match";
    /**
     * name "If-Modified-Since"
     */
    public const IF_MODIFIED_SINCE:String = "If-Modified-Since";
    /**
     * name "If-None-Match"
     */
    public const IF_NONE_MATCH:String = "If-None-Match";
    /**
     * name "If-Range"
     */
    public const IF_RANGE:String = "If-Range";
    /**
     * name "If-Unmodified-Since"
     */
    public const IF_UNMODIFIED_SINCE:String = "If-Unmodified-Since";
    /**
     * name "Last-Modified"
     */
    public const LAST_MODIFIED:String = "Last-Modified";
    /**
     * name "Location"
     */
    public const LOCATION:String = "Location";
    /**
     * name "Max-Forwards"
     */
    public const MAX_FORWARDS:String = "Max-Forwards";
    /**
     * name "Pragma"
     */
    public const PRAGMA:String = "Pragma";
    /**
     * name "Proxy-Authenticate"
     */
    public const PROXY_AUTHENTICATE:String = "Proxy-Authenticate";
    /**
     * name "Proxy-Authorization"
     */
    public const PROXY_AUTHORIZATION:String = "Proxy-Authorization";
    /**
     * name "Range"
     */
    public const RANGE:String = "Range";
    /**
     * name "Referer"
     */
    public const REFERER:String = "Referer";
    /**
     * name "Retry-After"
     */
    public const RETRY_AFTER:String = "Retry-After";
    /**
     * name "Server"
     */
    public const SERVER:String = "Server";
    /**
     * name "Set-Cookie"
     */
    public const SET_COOKIE:String = "Set-Cookie";
    /**
     * name "Set-Cookie2"
     */
    public const SET_COOKIE2:String = "Set-Cookie2";
    /**
     * name "TE"
     */
    public const TE:String = "TE";
    /**
     * name "Trailer"
     */
    public const TRAILER:String = "Trailer";
    /**
     * name "Transfer-Encoding"
     */
    public const TRANSFER_ENCODING:String = "Transfer-Encoding";
    /**
     * name "Upgrade"
     */
    public const UPGRADE:String = "Upgrade";
    /**
     * name "User-Agent"
     */
    public const USER_AGENT:String = "User-Agent";
    /**
     * name "Vary"
     */
    public const VARY:String = "Vary";
    /**
     * name "Via"
     */
    public const VIA:String = "Via";
    /**
     * name "Warning"
     */
    public const WARNING:String = "Warning";
    /**
     * name "WWW-Authenticate"
     */
    public const WWW_AUTHENTICATE:String = "WWW-Authenticate";
    
    private function HttpHeaderNames(){  
    	super();      	
    }
}
/**
 * Standard HTTP header values.
 */
final class HttpHeaderValues {
    /**
     * value "base64"
     */
    public const BASE64:String = "base64";
    /**
     * value "binary"
     */
    public const BINARY:String = "binary";
    /**
     * value "bytes"
     */
    public const BYTES:String = "bytes";
    /**
     * value "charset"
     */
    public const CHARSET:String = "charset";
    /**
     * value "chunked"
     */
    public const CHUNKED:String = "chunked";
    /**
     * value "close"
     */
    public const CLOSE:String = "close";
    /**
     * value "compress"
     */
    public const COMPRESS:String = "compress";
    /**
     * value "100-continue"
     */
    public const CONTINUE:String =  "100-continue";
    /**
     * value "deflate"
     */
    public const DEFLATE:String = "deflate";
    /**
     * value "gzip"
     */
    public const GZIP:String = "gzip";
    /**
     * value "identity"
     */
    public const IDENTITY:String = "identity";
    /**
     * value "keep-alive"
     */
    public const KEEP_ALIVE:String = "keep-alive";
    /**
     * value "max-age"
     */
    public const MAX_AGE:String = "max-age";
    /**
     * value "max-fresh"
     */
    public const MAX_FRESH:String = "max-fresh";
    /**
     * value "max-stale"
     */
    public const MAX_STALE:String = "max-stale";
    /**
     * value "must-revalidate"
     */
    public const MUST_REVALIDATE:String = "must-revalidate";
    /**
     * value "no-cache"
     */
    public const NO_CACHE:String = "no-cache";
    /**
     * value "no-store"
     */
    public const NO_STORE:String = "no-store";
    /**
     * value "no-transform"
     */
    public const NO_TRANSFORM:String = "no-transform";
    /**
     * value "none"
     */
    public const NONE:String = "none";
    /**
     * value "only-if-cached"
     */
    public const ONLY_IF_CACHED:String = "only-if-cached";
    /**
     * value "private"
     */
    public const PRIVATE:String = "private";
    /**
     * value "proxy-revalidate"
     */
    public const PROXY_REVALIDATE:String = "proxy-revalidate";
    /**
     * value "public"
     */
    public const PUBLIC:String = "public";
    /**
     * value "quoted-printable"
     */
    public const QUOTED_PRINTABLE:String = "quoted-printable";
    /**
     * value "s-maxage"
     */
    public const S_MAXAGE:String = "s-maxage";
    /**
     * value "trailers"
     */
    public const TRAILERS:String = "trailers";
    /**
     * value "application/octet-stream"
     */     
    public const APPLICATION_OCTET_STREAM:String = "application/octet-stream";
    /**
     * value "application/x-www-form-urlencoded"
     */
    public const APPLICATION_X_WWW_FORM_URLENCODED:String = "application/x-www-form-urlencoded";
    /**
     * value "application/x-amf"
     */
	public const APPLICATION_AMF:String = "application/x-amf";
	/**
	 * value "image/jpeg"
	 */
	public const IMAGE_JPEG:String = "image/jpeg";
	/**
	 * value "image/gif"
	 */
	public const IMAGE_GIF:String = "image/gif";
	
	/**
	 * value "application/x-shockwave-flash"
	 */
	public const APPLICATION_SWF:String = "application/x-shockwave-flash";
	
	
    private function HttpHeaderValues() {
        super();
    }
}
