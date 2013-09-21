package com.xmas.kits {
	import com.xmas.kits.vo.LabelVo;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Label extends Kit {
		private var _labelVo:LabelVo;
		private var _color:int;
		public function Label(labelVo:LabelVo) {
			_labelVo = labelVo;
			mouseEnabled = false;
			mouseChildren = false;
			_labelVo.textField.autoSize = TextFieldAutoSize.LEFT;
			addChild(_labelVo.textField);
		}
		public function get text():String {
			return _labelVo.textField.text;
		}
		public function set text(value:String):void {
			_labelVo.textField.text = value;
			redraw()
		}
		public function get color():int {
			return _color;
		}
		public function set color(value:int):void {
			_color = value;
			_labelVo.textField.textColor = value;
		}
		public function get wordWrap():Boolean {
			return _labelVo.textField.wordWrap;
		}
		public function set wordWrap(value:Boolean):void {
			_labelVo.textField.wordWrap = value;
			redraw()
		}
	}
}