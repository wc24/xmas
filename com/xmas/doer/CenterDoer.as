package com.xmas.doer {
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class CenterDoer {
		static public function tool(displayObject:DisplayObject):void {
			displayObject.x = -displayObject.width / 2
			displayObject.y = -displayObject.height / 2
		}
	}
}