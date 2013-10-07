package com.xmas.display {
	import com.xmas.utils.Painter;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class AlphaButton extends Sprite {
		private var useAlpha:Number = 0;
		public function AlphaButton(width:int, height:int) {
			super();
			CONFIG::debug {
				useAlpha = 0.3
			}
			Painter.drawRect(graphics, width, height, 0x00FFFF, useAlpha);
			this.buttonMode = true;
		}
	}
}