package com.klstudio.net.tunnel {

	/**
	 * Tunnel接口
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public interface ITunnel {
		/**
		 * Host地址
		 */
		function get host() : String;

		function set host(value : String) : void;

		/**
		 * 端口
		 */
		function get port() : int;

		function set port(value : int) : void;

		/**
		 * 代理
		 */
		function get proxy() : Proxy;

		function set proxy(value : Proxy) : void;

		/**
		 * 连接
		 */
		function connect() : void;

		/**
		 * 关闭连接
		 */
		function close() : void;
	}
}
