package com.xmas.events {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * PlusKeyboardEvent类为加强键盘事件,所包含的信息和KeyboardEvent一致，添加了相关事件的常量
	 * PlusKeyboardEvent类定义与 PlusKeyboard 关联的事件。这些事件包括下列事件：
	 * keyPressDown事件 指键盘按下事件，只响应第一次按下，要弹开按键后再次按下才有效。
	 * keyPressUp事件 指键盘弹开事件，当舞台失去焦点时也会响应弹开事件。
	 * @see easy.wc.plus.PlusKeyboard PlusKeyboard
	 */
	public class PlusKeyboardEvent extends KeyboardEvent {
		private var _keyboardEvent:KeyboardEvent;
		/**
		 * 定义 keyPressDown 事件对象的 type 属性值。
		 */
		static public const KEY_PRESS_DOWN:String = "keyPressDown";
		/**
		 * 定义 keyPressUp 事件对象的 type 属性值。
		 */
		static public const KEY_PRESS_UP:String = "keyPressUp";
		
		/**
		 * 创建新的加强键盘事件
		 * @param	type 事件的类型。 可能的值为：PlusKeyboardEvent.KEY_PRESS_DOWN 和 PlusKeyboardEvent.KEY_PRESS_UP。
		 * @param	bubbles  确定 Event 对象是否参与事件流的冒泡阶段。
		 * @param	cancelable 确定是否可以取消 Event 对象。
		 * @param	charCode 按下或释放的键的字符代码值。 返回的字符代码值为英文键盘值。 例如，如果您按 Shift+3，则 getASCIICode() 方法在日文键盘上将返回 #，就像在英文键盘上一样。
		 * @param	keyCode 按下或释放的键的键控代码值。
		 * @param	keyLocation 按键在键盘上的位置。
		 * @param	ctrlKey 指示是否已激活 Ctrl 功能键。
		 * @param	altKey 指示是否已激活 Alt 功能键（仅限 Windows）。
		 * @param	shiftKey 指示是否已激活 Shift 功能键。
		 */
		public function PlusKeyboardEvent(type:String, keyboardEvent:KeyboardEvent) {
			super(type, keyboardEvent.bubbles, keyboardEvent.cancelable, keyboardEvent.charCode, keyboardEvent.keyCode, keyboardEvent.keyLocation, keyboardEvent.ctrlKey, keyboardEvent.altKey, keyboardEvent.shiftKey);
			_keyboardEvent = keyboardEvent;
		}
		
		/**
		 * 返回一个字符串，其中包含 PlusKeyboardEvent 对象的所有属性。
		 * @return 一个字符串，其中包含 PlusKeyboardEvent 对象的所有属性。
		 */
		override public function toString():String {
			//	return "[PlusKeyboardEvent type=\"" + type + "\" bubbles=" + bubbles + " cancelable=" + cancelable + " eventPhase=" + eventPhase + " charCode=" + charCode + " keyCode=" + keyCode + " keyLocation=" + keyLocation + " ctrlKey=" + ctrlKey + " altKey=" + altKey + " shiftKey=" + shiftKey + "]";
			return formatToString("PlusKeyboardEvent", "type", "bubbles", "cancelable", "eventPhase", "charCode", "keyCode", "keyLocation", "ctrlKey", "altKey", "shiftKey");
		}
		
		override public function clone():Event {
			return new PlusKeyboardEvent(type, _keyboardEvent);
		}
		
		public function get keyboardEvent():KeyboardEvent {
			return _keyboardEvent;
		}
	}
}