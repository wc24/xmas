package com.xmas.brick.core {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	public class ButtonCore extends BrickCore implements IBrickCore {
		private var _isOver:Boolean
		public var normalSkin:DisplayObject;
		public var overSkin:DisplayObject;
		public var enabledSkin:DisplayObject;
		public var interactive:Sprite
		
		public function ButtonCore() {
			_isOver = false;
		}
		
		override public function start():void {
			checkNecessity(interactive, normalSkin)
			interactive.mouseChildren = false;
			interactive.mouseEnabled = true;
			interactive.buttonMode = true;
			interactive.useHandCursor = true;
			interactive.addEventListener(MouseEvent.MOUSE_OVER, interactive_mouseOver);
			interactive.addEventListener(MouseEvent.MOUSE_OUT, interactive_mouseOut);
			super.start();
		}
		
		override protected function draw():void {
			if (normalSkin) {
				normalSkin.visible = (_enabled || enabledSkin == null) && (!_isOver || overSkin == null);
			}
			if (overSkin) {
				overSkin.visible = _enabled && _isOver;
			}
			if (enabledSkin) {
				enabledSkin.visible = !_enabled;
			}
		}
		
		private function interactive_mouseOut(e:MouseEvent):void {
			_isOver = false;
			redraw(DrawPart.STATE);
		}
		
		private function interactive_mouseOver(e:MouseEvent):void {
			_isOver = true;
			redraw(DrawPart.STATE);
		}
		
		public function get isOver():Boolean {
			return _isOver;
		}
	
	}

}