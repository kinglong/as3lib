package com.klstudio.events {
	import flash.events.Event;

	/**
	 * ProxyEvent
	 * 代理事件
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-7-28
	 */
	public class ProxyEvent extends Event {
		public static const CONNECT:String="proxy-connect";
		public static const ERROR:String="proxy-error";
		
		public function ProxyEvent(type : String) {
			super(type);
		}
	}
}
