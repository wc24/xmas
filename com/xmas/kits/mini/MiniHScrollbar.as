package com.xmas.kits.mini {
	import com.xmas.kits.Scrollbar;
	import com.xmas.kits.vo.ScrollbarVo;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniHScrollbar extends Scrollbar {
		private var _scrollbarVo:ScrollbarVo;
		private var _miniHSlider:MiniHSlider;
		public function MiniHScrollbar(long:int) {
			_scrollbarVo = new ScrollbarVo();
			_miniHSlider = new MiniHSlider();
			_scrollbarVo.upSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.downSkin = new MiniNoneButton(14, 14);
			_scrollbarVo.barSkin = _miniHSlider;
			_scrollbarVo.long = long;
			_scrollbarVo.lineNumber = 20;
			super(_scrollbarVo)
			_scrollbarVo.upSkin.addEventListener(MouseEvent.MOUSE_DOWN, upSkin_mouseDown);
			_scrollbarVo.downSkin.addEventListener(MouseEvent.MOUSE_DOWN, downSkin_mouseDown);
		}
		private function downSkin_mouseDown(e:MouseEvent):void {
			_miniHSlider.ratio += 1 / _scrollbarVo.lineNumber;
		}
		private function upSkin_mouseDown(e:MouseEvent):void {
			_miniHSlider.ratio -= 1 / _scrollbarVo.lineNumber;
		}
		override public function draw():void {
			_scrollbarVo.downSkin.x = _scrollbarVo.upSkin.width + _scrollbarVo.long;
			_scrollbarVo.barSkin.x = _scrollbarVo.upSkin.width;
		}
	}
}