package com.xmas.brick.mini {
	import com.xmas.brick.core.BoxCore;
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.BrickEvent;
	import com.xmas.brick.core.DrawPart;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniBox extends BrickBase {
		private var boxCore:BoxCore;
		private var mask:Shape;
		
		public function MiniBox(width:int = 100, height:int = 100) {
			mask = new Shape();
			boxCore = new BoxCore();
			boxCore.content = this;
			boxCore.mask = mask;
			boxCore.width = width;
			boxCore.height = height;
			boxCore.start();
			boxCore.addEventListener(BrickEvent.DRAW, boxCore_draw);
			super(boxCore);
		}
		
		private function boxCore_draw(e:BrickEvent):void {
			if (boxCore.checkPart(DrawPart.SIZE)) {
				mask.graphics.clear();
				mask.graphics.beginFill(0, 0);
				mask.graphics.drawRect(0, 0, boxCore.width, boxCore.height);
				mask.graphics.endFill();
			}
		}
		
		public function get backgroundColor():int {
			return boxCore.backgroundColor;
		}
		
		public function set backgroundColor(value:int):void {
			boxCore.backgroundColor = value;
		}
		
		public function get backgroundAlpha():Number {
			return boxCore.backgroundAlpha;
		}
		
		public function set backgroundAlpha(value:Number):void {
			boxCore.backgroundAlpha = value;
		}
	}

}