package com.klstudio.events {
	import flash.events.Event;

	/**
	 * ResultEvent
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-3
	 */
	public class ResultEvent extends Event {
		public static const RESULT:String = "result";	

		public var result : Object;

		public function ResultEvent(type : String, result : Object,bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
			this.result = result;
		}
	}
}
