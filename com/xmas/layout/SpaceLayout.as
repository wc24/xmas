package com.xmas.layout {
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class SpaceLayout extends LayoutCore {
		public function SpaceLayout(boundRect:Rectangle, spaceH:int = 100, spaceV:int = 100) {
			super(boundRect, spaceH, spaceV);
		}
		
		override public function update():void {
			var targetX:Number = 0;
			var targetY:Number = 0;
			for (var i:int = 0; i < list.length; i++) {
				if (targetX + list[i].width > boundRect.width) {
					targetX = 0;
					targetY += spaceV;
				}
				list[i].x = boundRect.x + targetX;
				targetX += list[i].width + spaceH;
				list[i].y = boundRect.y + targetY;
			}
		}
	}
}