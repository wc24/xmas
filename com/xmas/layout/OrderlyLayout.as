package com.xmas.layout {
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class OrderlyLayout extends LayoutCore {
		public var ratioH:Number = 0
		public var ratioV:Number = 0
		private var careContainer:Boolean;
		
		public function OrderlyLayout(boundRect:Rectangle, spaceH:int = 100, spaceV:int = 100, careContainer:Boolean = true) {
			this.careContainer = careContainer;
			super(boundRect, spaceH, spaceV)
		}
		
		override public function update():void {
			var lenX:int = Math.floor(boundRect.width / spaceH);
			var lenY:int = Math.ceil(length / lenX);
			var containerOffsetX:int = careContainer ? boundRect.width * ratioH - lenX * spaceH * ratioH : 0;
			var containerOffsetY:int = careContainer ? boundRect.width * ratioV - lenY * spaceV * ratioV : 0;
			for (var i:int = 0; i < list.length; i++) {
				list[i].x = boundRect.x + i % lenX * spaceH - (list[i].width - spaceH) * ratioH + containerOffsetX
				list[i].y = boundRect.y + Math.floor(i / lenX) * spaceV - (list[i].height - spaceH) * ratioV + containerOffsetY;
			}
		}
	}
}