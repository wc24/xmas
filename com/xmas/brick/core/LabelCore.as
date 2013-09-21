package com.xmas.brick.core {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class LabelCore extends BrickCore implements IBrickCore {
		public var textField:TextField;
		private var _color:uint;
		private var _enabledColor:uint
		private var _autoSize:Boolean;
		private var _text:String
		
		public function LabelCore() {
		}
		
		override protected function draw():void {
			if (checkPart(DrawPart.VALUE)) {
				textField.text = _text;
			}
			if (checkPart(DrawPart.COLOR, DrawPart.STATE)) {
				textField.textColor = _enabled ? _color : _enabledColor;
			}
			if (checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				if (_autoSize) {
					textField.autoSize = TextFieldAutoSize.LEFT;
					textField.width = _width;
					referSize(textField);
				} else {
					textField.autoSize = TextFieldAutoSize.NONE;
					textField.width = _width;
					textField.height = _height;
				}
			}
		}
		
		/* INTERFACE com.xmas.brick.core.IBrickCore */
		
		override public function start():void {
			checkNecessity(textField)
			textField.selectable = false;
			super.start();
		}
		
		public function set text(value:String):void {
			_text = value;
			if (_text == null) {
				_text = "";
			}
			redraw(DrawPart.VALUE);
		}
		
		public function get text():String {
			return _text;
		}
		
		public function get color():uint {
			return _color;
		}
		
		public function set color(value:uint):void {
			_color = value;
			redraw(DrawPart.COLOR);
		}
		
		public function get autoSize():Boolean {
			return _autoSize;
		}
		
		public function set autoSize(value:Boolean):void {
			_autoSize = value;
			redraw(DrawPart.SIZE);
		}
		
		public function get enabledColor():uint {
			return _enabledColor;
			redraw(DrawPart.COLOR);
		}
		
		public function set enabledColor(value:uint):void {
			_enabledColor = value;
		}
	}
}