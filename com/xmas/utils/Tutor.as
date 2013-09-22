package com.xmas.utils {
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Tutor implements IDragObject {
		private var width:int;
		private var height:int;
		private var _x:Number = 0;
		private var _y:Number = 0;
		
		public function Tutor(width:int, height:int) {
			this.height = height;
			this.width = width;
		}
		
		/* INTERFACE com.xmas.utils.IDragObject */
		public function get x():Number {
			return _x;
		}
		
		public function set x(value:Number):void {
			_x = value;
		}
		
		public function get y():Number {
			return _y;
		}
		
		public function set y(value:Number):void {
			_y = value;
		}
		
		public function get tutorX():Number {
			return _x / width;
		}
		
		public function get tutorY():Number {
			return _y / height;
		}
	}
}