package com.klstudio.net.proxy {
	import com.klstudio.events.ProxyEvent;

	import flash.events.ProgressEvent;
	import flash.events.Event;
	import flash.net.Socket;

	/**
	 * HTTPProxySocket
	 * HTTP代码
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public class HTTPProxySocket extends Socket {
		private var _proxyHost : String;
		private var _proxyPort : int;
		private var _userAgent : String;
		private var _host : String;
		private var _port : int;

		public function HTTPProxySocket(host : String, port : int = 80,userAgent : String = "HTTP Proxy") {
			_proxyHost = host;
			_proxyPort = port;
			_userAgent = userAgent;
		}

		public function get proxyHost() : String {
			return _proxyHost;
		}

		public function get proxyPort() : int {
			return _proxyPort;
		}

		public function get host() : String {
			return _host;
		}

		public function get port() : int {
			return _port;
		}

		public function get userAgent() : String {
			return _userAgent;
		}

		override public function connect(host : String,port : int) : void {
			_host = host;
			_port = port;
			super.connect(_proxyHost, _proxyPort);
			super.addEventListener(Event.CONNECT, socketHandler, false, 0, true);			
		}

		override public function close() : void {			
			super.removeEventListener(Event.CONNECT, socketHandler);
			super.close();
		}

		private function socketHandler(event : Event) : void {
			switch(event.type) {
				case Event.CONNECT:
					super.writeUTFBytes("CONNECT " + _host + ":" + _port + " HTTP/1.0\r\nUser-Agent: " + _userAgent + "\r\nHost: " + _host + "\r\nContent-Length: 0\r\nProxy-Connection: Keep-Alive\r\n\r\n");
					super.removeEventListener(Event.CONNECT, socketHandler);
					super.addEventListener(ProgressEvent.SOCKET_DATA, socketHandler, false, 0, true);
					super.flush();
					break;
				case ProgressEvent.SOCKET_DATA:
					var et : ProxyEvent;
					var response : String = super.readUTFBytes(super.bytesAvailable);
					super.removeEventListener(ProgressEvent.SOCKET_DATA, socketHandler);
					if(response.lastIndexOf("established") != -1) {
						et = new ProxyEvent(ProxyEvent.CONNECT);
					} else {
						et = new ProxyEvent(ProxyEvent.ERROR);
					}
					dispatchEvent(et);
					break;
			}
		}
	}
}
