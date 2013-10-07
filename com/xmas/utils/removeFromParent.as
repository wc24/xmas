package com.xmas.utils {
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public function removeFromParent(target:DisplayObject):Boolean {
		if (target.parent != null) {
			target.parent.removeChild(target);
			return true
		}
		return false
	}
}