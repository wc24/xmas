package com.xmas.utils {
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class DisplayObjectUtils {
		public function DisplayObjectUtils() {
		}
		
		static public function fitOutside(displayObject:DisplayObject, width:int, height:int):void {
			displayObject.scaleX = displayObject.scaleY = 1;
			var scale:Number = Math.max(width / displayObject.width, height / displayObject.height);
			displayObject.scaleX = displayObject.scaleY = scale;
			displayObject.x = width - displayObject.width >> 1;
			displayObject.y = height - displayObject.height >> 1;
		}
		//static public function
		//public var Fit;
	}
}