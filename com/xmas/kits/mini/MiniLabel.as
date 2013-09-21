package com.xmas.kits.mini {
	import com.xmas.kits.Label;
	import com.xmas.kits.vo.LabelVo;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniLabel extends Label {
		private var _labelVo:LabelVo;
		private var _textField:TextField;
		public function MiniLabel(text:String = "") {
			_textField = new TextField();
			_textField.embedFonts = true;
			_textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			_labelVo = new LabelVo();
			_labelVo.textField = _textField
			super(_labelVo)
			this.text = text;
			this.color = int(MiniStyle.defaultTextFormat.color);
		}
		override public function draw():void {
			referSize(_labelVo.textField, 0, 0);
		}
	}
}