package com.xmas.doer {
	import com.xmas.standard.IRectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class RectangleDoer extends LocationDoer implements IRectangle {
		public function RectangleDoer(target:Object) {
			super(target)
			if (!target.hasOwnProperty("width") || !target.hasOwnProperty("height")) {
				trace("对象不行")
			}
		}
		
		/* INTERFACE com.xmas.standard.IRectangle */
		public function get width():Number {
			return target["width"];
		}
		
		public function set width(value:Number):void {
			target["width"] = value;
		}
		
		public function get height():Number {
			return target["height"];
		}
		
		public function set height(value:Number):void {
			target["height"] = value;
		}
	}
}