package com.xmas.doer {
	import com.xmas.standard.IPoint;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class LocationDoer implements IPoint {
		private var target:Object;
		
		public function LocationDoer(target:Object) {
			this.target = target;
			if (!target.hasOwnProperty("x") || !target.hasOwnProperty("y")) {
				trace("对象不行")
			}
		}
		
		/* INTERFACE com.xmas.standard.IPoint */
		public function get x():Number {
			return target["x"];
		}
		
		public function set x(value:Number):void {
			target["x"] = value;
		}
		
		public function get y():Number {
			return target["y"];
		}
		
		public function set y(value:Number):void {
			target["y"] = value;
		}
	}
}