package com.xmas.brick.mini {
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.LabelCore;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniLabel extends BrickBase {
		private var labelCore:LabelCore;
		private var textField:TextField;
		
		public function MiniLabel(text:String = "") {
			mouseEnabled = false;
			mouseChildren = false;
			textField = new TextField();
			textField.embedFonts = true;
			textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			labelCore = new LabelCore();
			labelCore.text = text;
			labelCore.autoSize = true;
			labelCore.textField = textField
			labelCore.color = int(MiniStyle.defaultTextFormat.color);
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
		
		public function get label():String {
			return labelCore.text;
		}
		
		public function set label(value:String):void {
			labelCore.text = value;
		}
	}
}