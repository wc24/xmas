package com.xmas.brick.core {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class BoxCore extends BrickCore {
		public var content:Sprite;
		public var mask:Shape;
		public var backgroundColor:int;
		public var backgroundAlpha:Number;
		
		public function BoxCore(width:int = 100, height:int = 100) {
			_width = width;
			_height = height;
			backgroundColor = 0;
			backgroundAlpha = 0;
		}
		/**
		 * 关系到执行渲染的循序
		 */
		override public function start():void {
			checkNecessity(content, mask)
			content.mask = mask
			content.addChildAt(mask, 0)
			super.start();
		}
		
		override protected function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				content.graphics.clear();
				content.graphics.beginFill(backgroundColor, backgroundAlpha);
				content.graphics.drawRect(0, 0, _width, _height);
				content.graphics.endFill();
			}
			super.draw();
		}
	
	}

}