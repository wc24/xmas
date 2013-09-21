package com.xmas.brick.mini {
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.TextButtonCore;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniTextButton extends BrickBase {
		public var color:Number;
		private var textButtonCore:TextButtonCore;
		private var textField:TextField;
		
		public function MiniTextButton(text:String = "") {
			textField = new TextField();
			textField.embedFonts = true;
			textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			textButtonCore = new TextButtonCore();
			textButtonCore.interactive = this;
			textButtonCore.overColor = MiniStyle.textOverColor;
			textButtonCore.enabledColor = MiniStyle.textEnabledColor;
			textButtonCore.color = int(MiniStyle.defaultTextFormat.color);
			textButtonCore.textField = textField
			textButtonCore.text = text;
			textButtonCore.start();
			addChild(textField);
			super(textButtonCore)
		}
	}
}

