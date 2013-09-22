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
			if (_labelVo.autoSize) {
				_labelVo.textField.autoSize = TextFieldAutoSize.LEFT;
			} else {
				_labelVo.textField.autoSize = TextFieldAutoSize.NONE;
			}
			_labelVo.textField.wordWrap = _labelVo.wordWrap
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
			return _labelVo.color;
		}
		
		public function set color(value:int):void {
			_labelVo.color = value;
			enabled = super.enabled;
		}
		
		public function get disableColor():int {
			return _labelVo.disableColor;
		}
		
		public function set disableColor(value:int):void {
			_labelVo.disableColor = value;
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			_labelVo.textField.textColor = super.enabled ? _labelVo.color : _labelVo.disableColor;
		}
	}
}