package com.xmas.brick.mini {
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.LabelCore;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniTextbox extends BrickBase {
		private var labelCore:LabelCore;
		private var textField:TextField;
		
		public function MiniTextbox(text:String = "", width = 100, height = 100) {
			mouseEnabled = false;
			mouseChildren = false;
			textField = new TextField();
			textField.wordWrap = true;
			textField.embedFonts = true;
			textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			labelCore = new LabelCore();
			labelCore.text = text;
			labelCore.autoSize = true;
			labelCore.textField = textField
			labelCore.color = int(MiniStyle.defaultTextFormat.color);
			labelCore.width = width;
			labelCore.height = height;
			labelCore.start();
			addChild(textField)
			super(labelCore)
		}
		
		public function get color():int {
			return labelCore.color;
		}
		
		public function set color(value:int):void {
			labelCore.color = value;
		}
		
		public function get text():String {
			return labelCore.text;
		}
		
		public function set text(value:String):void {
			labelCore.text = value;
		}
	}
}