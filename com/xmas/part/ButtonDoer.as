package com.xmas.part {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ButtonDoer extends PartDoer {
		private var area:Sprite;
		private var _state:String;
		static public const NORMAL:String = "normal";
		static public const OVER:String = "over";
		static public const DOWN:String = "down";
		public function ButtonDoer(area:Sprite) {
			start(area)
		}
		public function start(area:Sprite):void {
			if (area) {
				this.area = area;
				activate()
			}
		}
		override public function activate():void {
			super.activate();
			area.buttonMode = true;
			area.mouseEnabled = true;
			area.mouseChildren = false;
			area.useHandCursor = true;
			area.addEventListener(MouseEvent.MOUSE_DOWN, area_mouseDown);
			area.addEventListener(MouseEvent.MOUSE_UP, area_mouseUp);
			area.addEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
			area.addEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
			setState(NORMAL);
		}
		override public function deactivate():void {
			area.removeEventListener(MouseEvent.MOUSE_DOWN, area_mouseDown);
			area.removeEventListener(MouseEvent.MOUSE_UP, area_mouseUp);
			area.removeEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
			area.removeEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
		}
		override public function destroy():void {
			super.destroy();
			area = null;
		}
		private function area_mouseOut(e:MouseEvent):void {
			setState(NORMAL);
		}
		private function area_mouseOver(e:MouseEvent):void {
			setState(OVER);
		}
		private function area_mouseUp(e:MouseEvent):void {
			setState(OVER);
		}
		private function area_mouseDown(e:MouseEvent):void {
			setState(DOWN);
		}
		public function get state():String {
			return _state;
		}
		private function setState(value:String):void {
			_state = value;
			change()
		}
	}
}