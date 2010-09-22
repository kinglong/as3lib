package com.klstudio.net.remoting {
	import com.klstudio.log4a.Logger;
	import com.klstudio.events.FaultEvent;
	import com.klstudio.events.ResultEvent;
	import flash.net.Responder;
	import flash.events.EventDispatcher;

	/**
	 * Operation 
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-3
	 */
	[Event(name="fault", type="com.klstudio.events.FaultEvent")]	
	[Event(name="result", type="com.klstudio.events.ResultEvent")]
	
	public class Operation extends EventDispatcher {
		private var _service:Service;
		private var _name:String;
		private var _responder:Responder;
		public function Operation(service:Service,name:String) {
			_service = service;
			_name = name;
			_responder = new Responder ( resultHandler, statusHandler );			
		}
		/**
		 * public
		 */
		public function get service():Service{
			return _service;
		}
		
		public function get name():String{
			return _name;
		}
		
		public function send(...args:Array):void{									
			var params:Array = [_service.destination + "." + _name,_responder];
			params = params.concat(args);
			Logger.debug(this, "send", params);
			_service.connenction.call.apply(_service.connenction,params);
		}
		
		override public function toString():String{
			return "[Operation name="+name+"]";
		}

		/**
		 * private
		 */
		private function resultHandler(info:Object):void{
			Logger.debug(this,"resultHandler","info=" + info);
			var event:ResultEvent = new ResultEvent(ResultEvent.RESULT, info);
			if(hasEventListener(ResultEvent.RESULT)){
				dispatchEvent(event);
			}else {
				_service.dispatchEvent(event);
			}
		}
		
		private function statusHandler(info:Object):void{			
			var fault:Fault = new Fault(info["code"], info["message"],info["details"]);
			Logger.warn(this,"statusHandler",fault);
			var event:FaultEvent = new FaultEvent(FaultEvent.FAULT, fault);
			if(hasEventListener(FaultEvent.FAULT)){
				dispatchEvent(event);
			}else{
				_service.dispatchEvent(event);			
			}
		}
	}
}
