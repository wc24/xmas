package com.xmas.kits.mini {
	import com.xmas.kits.Box;
	import com.xmas.kits.vo.BoxVo;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniBox extends Box {
		private var _boxVo:BoxVo;
		
		public function MiniBox(width:int = 100, height:int = 100) {
			_boxVo = new BoxVo();
			_boxVo.mask = new Shape()
			_boxVo.width = width;
			_boxVo.height = height;
			super(_boxVo);
		}
		
		override public function draw():void {
			_boxVo.mask.graphics.clear();
			_boxVo.mask.graphics.beginFill(0,0);
			_boxVo.mask.graphics.drawRect(0, 0, width, height);
			_boxVo.mask.graphics.endFill();
			super.draw();
		}
	}
}