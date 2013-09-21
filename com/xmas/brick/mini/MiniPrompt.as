package com.xmas.brick.mini {
	import com.xmas.brick.core.BrickEvent;
	import com.xmas.brick.core.DrawPart;
	
	public class MiniPrompt extends MiniWindow {
		
		public var submitButton:MiniButton;
		
		public function MiniPrompt(width:int) {
			super(width)
			core.addEventListener(BrickEvent.DRAW, boxCore_draw);
			submitButton = new MiniButton("SUBMIT")
			addChild(submitButton)
		}
		
		private function boxCore_draw(e:BrickEvent):void {
			trace("submitButton.width",submitButton.width,core.width)
			if (core.checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				submitButton.y = core.height - 20;
				submitButton.x = core.width / 2 - submitButton.width / 2;
			}
		}
	
	}

}