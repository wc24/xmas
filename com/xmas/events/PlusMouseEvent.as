package com.xmas.events {
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * PlusMouseEvent类为加强键盘事件,所包含的信息和MouseEvent一致，添加了相关事件的常量
	 * PlusMouseEvent类定义与 MouseEvent 关联的事件。这些事件包括下列事件：
	 * free事件 指松开鼠标。
	 * drag事件 指拖动鼠标。
	 * @see easy.wc.plus.PlusMouseDrag PlusMouseDrag
	 */
	public class PlusMouseEvent extends MouseEvent {
		private var _mouseEvent:MouseEvent;
		/**
		 * 定义 free 事件对象的 type 属性值。
		 */
		static public const FREE:String = "free";
		/**
		 * 定义 drag 事件对象的 type 属性值。
		 */
		static public const DRAG:String = "drag";
		static public const SHORT_PRESSING:String = "shortPressing";
		static public const LONG_PRESS:String = "longPress";
		static public const LONG_PRESSING:String = "longPressing";
		static public const PRESSING:String = "pressing";
		static public const RELEASE:String = "release";
		static public const ONCE_CLICK:String = "onceClick";
		static public const TWICE_CLICK:String = "twiceClick";
		static public const ROCK:String = "rock";
		static public const MOVE_CLICK:String = "moveClick";
		static public const STATIC_CLICK:String = "staticClick";
		
		/**
		 * 创建一个 Event 对象，其中包含有关鼠标事件的信息。 将 Event 对象作为参数传递给事件侦听器。 (所包含的信息和MouseEvent一致，添加了相关事件的常量)
		 * @param	type 事件的类型。
		 * @param	bubbles  确定 Event 对象是否参与事件流的冒泡阶段。
		 * @param	cancelable 确定是否可以取消 Event 对象。
		 * @param	ctrlKey 指示是否已激活 Ctrl 功能键。
		 * @param	altKey 指示是否已激活 Alt 功能键（仅限 Windows）。
		 * @param	shiftKey 指示是否已激活 Shift 功能键。
		 */
		public function PlusMouseEvent(type:String, mouseEvent:MouseEvent) {
			super(type, mouseEvent.bubbles, mouseEvent.cancelable, mouseEvent.localX, mouseEvent.localY, mouseEvent.relatedObject, mouseEvent.ctrlKey, mouseEvent.altKey, mouseEvent.shiftKey, mouseEvent.buttonDown, mouseEvent.delta);
			_mouseEvent = mouseEvent;
		}
		
		/**
		 *  返回一个字符串，其中包含 PlusMouseEvent 对象的所有属性。
		 * @return  一个字符串，其中包含 PlusMouseEvent 对象的所有属性.
		 */
		override public function toString():String {
			return formatToString("PlusMouseEvent", "type", "bubbles", "cancelable", "localX", "localY", "relatedObject", "ctrlKey", "altKey", "shiftKey", "buttonDown", "delta");
		}
		
		override public function clone():Event {
			return new PlusMouseEvent(type, _mouseEvent);
		}
		
		public function get mouseEvent():MouseEvent {
			return _mouseEvent;
		}
	}
}