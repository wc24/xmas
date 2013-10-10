package com.xmas.plus {
	import com.xmas.core.AutoDoer;
	import com.xmas.events.PlusMouseEvent;
	import flash.display.InteractiveObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	/**
	 * free 鼠标拖动事件。
	 * @eventType com.xmas.events.PlusMouseEvent.DRAG
	 */
	[Event(name="drag",type="com.xmas.events.PlusMouseEvent")]
	/**
	 * free 鼠标松开事件。
	 * @eventType com.xmas.events.PlusMouseEvent.FREE
	 */
	[Event(name="free",type="com.xmas.events.PlusMouseEvent")]
	
	public class PlusMouseDrag extends AutoDoer {
		private var _interactiveObject:InteractiveObject;
		public static var isDragUp:Boolean = false;
		
		public function PlusMouseDrag(dispatcher:IEventDispatcher = null) {
			super(dispatcher);
		}
		
		override public function deactivate():void {
			_interactiveObject.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveEvent)
			stage.removeEventListener(MouseEvent.MOUSE_UP, upEvent)
		}
		
		override public function activate():void {
			_interactiveObject.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function mouseDown(e:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveEvent)
			stage.addEventListener(MouseEvent.MOUSE_UP, upEvent)
		}
		
		protected function moveEvent(e:MouseEvent):void {
			dispatchEvent(new PlusMouseEvent(PlusMouseEvent.DRAG, e));
			if (isDragUp) {
				e.updateAfterEvent();
			}
		}
		
		protected function upEvent(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveEvent)
			stage.removeEventListener(MouseEvent.MOUSE_UP, upEvent)
			dispatchEvent(new PlusMouseEvent(PlusMouseEvent.FREE, e));
		}
		
		public function get interactiveObject():InteractiveObject {
			return _interactiveObject;
		}
		
		public function set interactiveObject(value:InteractiveObject):void {
			_interactiveObject = value;
			target = value;
		}
	}
}