package com.xmas.original {
	import com.xmas.standard.IDragObject;
	
	public class PlaneMoveVo {
		private var _scale:Number
		private var _startX:Number
		private var _startY:Number
		private var _endX:Number
		private var _endY:Number
		private var _x:Number;
		private var _y:Number;
		
		public function PlaneMoveVo() {
			_x = 0;
			_y = 0;
			_scale = 1;
		}
		
		public function start(x:int, y:int):void {
			_startX = x;
			_startY = y;
		}
		
		public function end(x:int, y:int):void {
			_endX = x;
			_endY = y;
		}
		
		public function get x():Number {
			return _x + (_endX - _startX) * _scale;
		}
		
		public function set x(value:Number):void {
			_x = value;
		}
		
		public function get y():Number {
			return _y + (_endY - _startY) * _scale;
		}
		
		public function set y(value:Number):void {
			_y = value;
		}
		
		public function get scale():Number {
			return _scale;
		}
		
		public function set scale(value:Number):void {
			_scale = value;
		}
		
		public function updata():void {
			x = x;
			y = y;
			start(0, 0)
			end(0, 0)
		}
	}
}