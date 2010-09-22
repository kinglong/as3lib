package com.klstudio.events {
	import com.klstudio.net.remoting.Fault;

	import flash.events.Event;

	/**
	 * FaultEvent
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-3
	 */
	public class FaultEvent extends Event {
		public static const FAULT : String = "fault";	

		public var fault : Fault;

		public function FaultEvent(type : String, fault : Fault,bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
			this.fault = fault;
		}
	}
}
