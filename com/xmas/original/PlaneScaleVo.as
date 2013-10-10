package com.xmas.original {
	import com.xmas.standard.IPoint;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class PlaneScaleVo implements IPoint {
		private var _width:int = 100;
		private var _height:int = 100;
		private var _x:Number = 0;
		private var _y:Number = 0;
		
		public function PlaneScaleVo(width:int, height:int) {
			this.height = height;
			this.width = width;
		}
		
		/* INTERFACE com.xmas.utils.IPoint */
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
		
		public function get scaleX():Number {
			return _x / width;
		}
		
		public function get scaleY():Number {
			return _y / height;
		}
		
		public function set scaleX(value:Number):void {
			_x = width * value;
		}
		
		public function set scaleY(value:Number):void {
			_y = height * value;
		}
		
		public function get width():int {
			return _width;
		}
		
		public function set width(value:int):void {
			_width = value;
		}
		
		public function get height():int {
			return _height;
		}
		
		public function set height(value:int):void {
			_height = value;
		}
	}
}