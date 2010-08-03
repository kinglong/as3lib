package com.klstudio.net.tunnel {

	/**
	 * HttpTunnel
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public class HttpTunnel {
		public static const TUNNEL_OPEN : int = 1;
		public static const TUNNEL_DATA : int = 2;
		public static const TUNNEL_PADDING : int = 3;
		public static const TUNNEL_ERROR : int = 4;
		public static const TUNNEL_PAD1 : int = 5 | TUNNEL_SIMPLE;
		public static const TUNNEL_CLOSE : int = 6 | TUNNEL_SIMPLE;
		public static const TUNNEL_DISCONNECT : int = 7 | TUNNEL_SIMPLE;
		public static const TUNNEL_SIMPLE : int = 0x40;
	}
}
