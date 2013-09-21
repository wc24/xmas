package com.xmas.kits {
	import com.xmas.kits.vo.TextButtonVo;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class TextButton extends Kit {
		static public const NORMAL:String = "normal";
		static public const DISABLE:String = "disable";
		static public const OVER:String = "over";
		static public const DOWN:String = "down";
		private var _textButtonVo:TextButtonVo;
		private var _state:String;
		private var _normalColor:int;
		private var _downColor:int;
		private var _overColor:int;
		private var _disableColor:int;
		public function TextButton(textButtonVo:TextButtonVo) {
			_textButtonVo = textButtonVo;
			mouseChildren = false;
			mouseEnabled = true;
			buttonMode = true;
			useHandCursor = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			_normalColor = textButtonVo.normalColor;
			_downColor = textButtonVo.downColor || textButtonVo.overColor || textButtonVo.normalColor;
			_overColor = textButtonVo.overColor || textButtonVo.normalColor;
			_disableColor = textButtonVo.disableColor || textButtonVo.normalColor;
			_textButtonVo.textField.autoSize = TextFieldAutoSize.LEFT;
			addChild(_textButtonVo.textField);
		}
		private function mouseDown(e:MouseEvent):void {
			state = Button.DOWN
		}
		private function mouseOut(e:MouseEvent):void {
			state = Button.NORMAL
		}
		private function mouseOver(e:MouseEvent):void {
			state = Button.OVER
		}
		override public function get enabled():Boolean {
			return super.enabled;
		}
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			if (value) {
				state = Button.NORMAL
			} else {
				state = Button.DISABLE
			}
		}
		public function get state():String {
			return _state;
		}
		public function set state(value:String):void {
			_state = value;
			switch (state) {
				case Button.NORMAL: 
					_textButtonVo.textField.textColor = _normalColor
					break;
				case Button.DOWN: 
					_textButtonVo.textField.textColor = _downColor
					break;
				case Button.OVER: 
					_textButtonVo.textField.textColor = _overColor
					break;
				case Button.DISABLE: 
					_textButtonVo.textField.textColor = _disableColor
					break;
			}
		}
		public function get label():String {
			return _textButtonVo.textField.text;
		}
		public function set label(value:String):void {
			_textButtonVo.textField.text = value;
			redraw()
		}
		public function get color():int {
			return _normalColor;
		}
		public function set color(value:int):void {
			_normalColor = value;
			state = state;
		}
	}
}