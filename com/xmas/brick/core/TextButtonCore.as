package com.xmas.brick.core {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class TextButtonCore extends LabelCore {
		public var overColor:uint;
		public var interactive:Sprite
		protected var _isOver:Boolean
		
		public function TextButtonCore() {
			_isOver = false;
			autoSize = true;
		}
		
		override public function start():void {
			checkNecessity(interactive)
			interactive.mouseChildren = false;
			interactive.mouseEnabled = true;
			interactive.buttonMode = true;
			interactive.useHandCursor = true;
			interactive.addEventListener(MouseEvent.MOUSE_OVER, interactive_mouseOver);
			interactive.addEventListener(MouseEvent.MOUSE_OUT, interactive_mouseOut);
			super.start();
		}
		
		override protected function draw():void {
			if (deletePart(DrawPart.COLOR, DrawPart.STATE)) {
				textField.textColor = enabled ? (_isOver ? overColor : color) : enabledColor;
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
	
	}
}