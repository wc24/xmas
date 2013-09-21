package com.xmas.kits.vo {
	import com.xmas.kits.KitVo;
	import com.xmas.kits.Label;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ButtonVo extends KitVo {
		public var normalSkin:Sprite;
		public var downSkin:Sprite;
		public var overSkin:Sprite;
		public var disableSkin:Sprite;
		public var label:Label;
		public function ButtonVo() {
			super();
		}
	}
}