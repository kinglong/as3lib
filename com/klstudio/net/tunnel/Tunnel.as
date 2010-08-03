package com.klstudio.net.tunnel {

	/**
	 * Tunnel
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public class Tunnel implements ITunnel {
		private var _host : String;
		private var _port : int;
		private var _proxy : Proxy;

		public function Tunnel(host : String = null,port : int = 8080) {
			_host = host;
			_port = port;
		}

		public function set host(value : String) : void {
			_host = value;
		}

		public function get host() : String {
			return _host;
		}

		public function set port(value : int) : void {
			_port = value;
		}

		public function get port() : int {
			return _port;
		}

		public function set proxy(value : Proxy) : void {
			_proxy = value;
		}

		public function get proxy() : Proxy {
			return _proxy;
		}

		public function connect() : void {			
		}

		public function close() : void {			
		}
	}
}
