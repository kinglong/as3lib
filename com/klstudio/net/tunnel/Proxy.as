package com.klstudio.net.tunnel {

	/**
	 * Proxy
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public class Proxy {

		private var _host : String;
		private var _port : int;
		private var _authName : String;
		private var _authPassword : String;		

		public function Proxy(host : String,port : int) {
			_host = host;
			_port = port;
		}

		public function get host() : String {
			return _host;
		}

		public function get port() : int {
			return _port;
		}

		public function get authName() : String {
			return _authName;
		}

		public function get authPassword() : String {
			return _authPassword;
		}

		public function setAuth(name : String,password : String) : void {
			_authName = name;
			_authPassword = password;
		}
	}
}
