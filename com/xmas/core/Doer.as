package com.xmas.core {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.EventDispatcher;
	
	public class Doer implements IEventDispatcher {
		private var _dispatcher:EventDispatcher;
		
		public function Doer(dispatcher:EventDispatcher = null) {
			_dispatcher = dispatcher;
			if (_dispatcher == null) {
				_dispatcher = new EventDispatcher(this);
			}
		}
		
		/* INTERFACE flash.events.IEventDispatcher */
		public function dispatchEvent(event:Event):Boolean {
			return _dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean {
			return _dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean {
			return _dispatcher.willTrigger(type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function get dispatcher():EventDispatcher {
			return _dispatcher;
		}
		
		public function set dispatcher(value:EventDispatcher):void {
			_dispatcher = value;
		}
	}
}