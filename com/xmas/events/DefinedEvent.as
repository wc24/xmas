package com.xmas.events {
	import flash.events.Event;
	
	public class DefinedEvent extends Event {
		private var _data:Object;
		
		public function DefinedEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, data:Object) {
			super(type, bubbles, cancelable)
			_data = data;
		}
		
		override public function toString():String {
			return formatToString("DefinedEvent", "type", "bubbles", "cancelable", "data");
		}
		
		override public function clone():Event {
			return new DefinedEvent(type, bubbles, cancelable, _data);
		}
		
		public function get data():Object {
			return _data;
		}
		
		public function get array():Array {
			return _data as Array;
		}
		
		public function set data(value:Object):void {
			_data = value;
		}
	}
}