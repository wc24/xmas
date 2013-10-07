package com.xmas.doer {
	import com.xmas.core.AutoDoer;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class RotateDoer extends AutoDoer {
		private var rotateSpeed:Number = 1;
		public function RotateDoer(display:DisplayObject) {
			target = display;
		}
		public static function add(display:DisplayObject):void {
			new RotateDoer(display)
		}
		override public function activate():void {
			target.addEventListener(Event.ENTER_FRAME, target_enterFrame);
		}
		override public function deactivate():void {
			target.removeEventListener(Event.ENTER_FRAME, target_enterFrame);
		}
		private function target_enterFrame(e:Event):void {
			target.rotation += rotateSpeed;
		}
	}
}