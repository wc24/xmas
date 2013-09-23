package com.xmas.plus {
	import com.xmas.core.AutoDoer;
	import com.xmas.events.PlusMouseEvent;
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 * 开发类
	 */
	[Event(name="shortPressing", type="com.xmas.events.PlusMouseEvent")]
	[Event(name="longPress", type="com.xmas.events.PlusMouseEvent")]
	[Event(name="longPressing", type="com.xmas.events.PlusMouseEvent")]
	[Event(name="pressing", type="com.xmas.events.PlusMouseEvent")]
	[Event(name="release", type="com.xmas.events.PlusMouseEvent")]
	public class PlusMousePress extends AutoDoer {
		private var _frame:int = 10;
		private var frameId:int = 0;
		private var event:MouseEvent;
		private var _interactiveObject:InteractiveObject;
		
		public function PlusMousePress(dispatcher:EventDispatcher = null) {
			super(dispatcher)
		}
		
		public function get interactiveObject():InteractiveObject {
			return _interactiveObject;
		}
		
		public function set interactiveObject(value:InteractiveObject):void {
			_interactiveObject = value;
			target = value;
		}
		
		//-------------------------------
		public function get frame():int {
			return _frame;
		}
		
		public function set frame(value:int):void {
			_frame = value;
		}
		
		override public function activate():void {
			frameId = 0;
			_interactiveObject.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function mouseDown(e:MouseEvent):void {
			this.event = e;
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHd)
			stage.addEventListener(MouseEvent.MOUSE_UP, upEvent)
		}
		
		override public function deactivate():void {
			_interactiveObject.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, upEvent)
			stage.removeEventListener(Event.ENTER_FRAME, enterFrameHd)
		}
		
		private function enterFrameHd(e:Event):void {
			frameId++
			if (frameId < _frame) {
				dispatchEvent(new PlusMouseEvent(PlusMouseEvent.SHORT_PRESSING, event));
			} else if (frameId == _frame) {
				dispatchEvent(new PlusMouseEvent(PlusMouseEvent.LONG_PRESS, event));
			} else {
				dispatchEvent(new PlusMouseEvent(PlusMouseEvent.LONG_PRESSING, event));
			}
			dispatchEvent(new PlusMouseEvent(PlusMouseEvent.PRESSING, event));
		}
		
		protected function upEvent(e:MouseEvent):void {
			stage.removeEventListener(Event.ENTER_FRAME, enterFrameHd)
			stage.removeEventListener(MouseEvent.MOUSE_UP, upEvent)
			frameId = 0;
			dispatchEvent(new PlusMouseEvent(PlusMouseEvent.RELEASE, e));
		}
	}
}