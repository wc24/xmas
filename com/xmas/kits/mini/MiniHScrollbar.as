package com.xmas.kits.mini {
	import com.xmas.kits.Scrollbar;
	import com.xmas.kits.vo.ScrollbarVo;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniHScrollbar extends Scrollbar {
		private var scrollbarVo:ScrollbarVo;
		public function MiniHScrollbar(long:int) {
			scrollbarVo = new ScrollbarVo();
			scrollbarVo.upSkin = new MiniNoneButton(14, 14);
			scrollbarVo.downSkin = new MiniNoneButton(14, 14);
			scrollbarVo.barSkin = new MiniHSlider()
			scrollbarVo.long = long;
			scrollbarVo.lineNumber = 100;
			super(scrollbarVo)
		}
		override public function draw():void {
			//scrollbarVo.downSkin.x = scrollbarVo.upSkin.width + scrollbarVo.long;
			//scrollbarVo.barSkin.x = scrollbarVo.upSkin.width;
		}
	}
}