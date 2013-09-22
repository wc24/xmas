package com.xmas.kits.mini {
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniPrompt extends MiniWindow {
		private var _textbox:MiniTextbox;
		private var _submitButton:MiniButton;
		
		public function MiniPrompt(width:int = 200) {
			_textbox = new MiniTextbox("fuck", width - 10)
			_textbox.move(5, 5);
			_submitButton = new MiniButton("SUBMIT")
			super(width, 50);
			content.addChild(_textbox)
			content.addChild(_submitButton)
		}
		
		override public function draw():void {
			content.referSize(_textbox, 10, 30);
			content.draw();
			_height = content.height + windowVo.titleBox.height;
			submitButton.y = content.height - 20;
			submitButton.x = content.width / 2 - submitButton.width / 2;
			super.draw();
		}
		
		public function get text():String {
			return _textbox.text;
		}
		
		public function set text(value:String):void {
			_textbox.text = value;
			redraw();
		}
		
		public function get submitButton():MiniButton {
			return _submitButton;
		}
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			_textbox.width = value - 10
			super.width = value;
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			_textbox.enabled = value;
			_submitButton.enabled = value;
			windowVo.title.enabled = value;
			windowVo.closeButton.enabled = value;
		}
	}
}