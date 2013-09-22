package com.xmas.kits {
	import com.xmas.kits.vo.ScrollbarVo;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Scrollbar extends Kit {
		private var _scrollbarVo:ScrollbarVo;
		public function Scrollbar(scrollbarVo:ScrollbarVo) {
			_scrollbarVo = scrollbarVo;
			super();
			addChild(_scrollbarVo.barSkin)
			addChild(_scrollbarVo.downSkin)
			addChild(_scrollbarVo.upSkin)
			//_scrollbarVo.upSkin.addEventListener(MouseEvent.CLICK, upSkin_click);
			//_scrollbarVo.downSkin.addEventListener(MouseEvent.CLICK, downSkin_click);
			//_scrollbarVo.barSkin
			//_scrollbarVo.lineNumber
		}
		//private function downSkin_click(e:MouseEvent):void {
		//_scrollbarVo.barSkin.tutor.
		//}
		//private function upSkin_click(e:MouseEvent):void {
		//}
		//public function get ratioX():Number {
		//return _scrollbarVo.barSkin.tutor.tutorX;
		//}
		//public function get ratioY():Number {
		//return _scrollbarVo.barSkin.tutor.tutorY;
		//}
		//public function set ratio(x:Number,y:Number):void {
		//_scrollbarVo.barSkin.tutor.tutorY = bound(vaule, 0, 1);
		//upSlip();
		//}
	}
}