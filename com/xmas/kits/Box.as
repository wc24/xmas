package com.xmas.kits {
	import com.xmas.kits.vo.BoxVo;
	
	public class Box extends Kit {
		private var _boxVo:BoxVo;
		
		public function Box(boxVo:BoxVo) {
			super();
			_boxVo = boxVo;
			if (boxVo.mask) {
				addChild(boxVo.mask);
				this.mask = boxVo.mask
			}
			width = boxVo.width;
			height = boxVo.height;
		}
		
		public function get backgroundColor():int {
			return _boxVo.backgroundColor;
		}
		
		public function set backgroundColor(value:int):void {
			_boxVo.backgroundColor = value;
			redraw()
		}
		
		public function get backgroundAlpha():Number {
			return _boxVo.backgroundAlpha;
		}
		
		public function set backgroundAlpha(value:Number):void {
			_boxVo.backgroundAlpha = value;
			redraw()
		}
		
		override public function draw():void {
			graphics.clear();
			graphics.beginFill(_boxVo.backgroundColor, _boxVo.backgroundAlpha);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
	}
}