package com.xmas.utils
{
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public function getScrollRect(displayRect:Rectangle, windowRect:Rectangle, alignX:Number = 0, alignY:Number = 0):Rectangle
	{
		var rect:Rectangle = new Rectangle();
		rect.width = windowRect.width;
		rect.height = windowRect.height;
		rect.x = (displayRect.width - windowRect.width) * alignX + displayRect.x - windowRect.x;
		rect.y = (displayRect.height - windowRect.height) * alignY + displayRect.y - windowRect.y;
		//trace(windowRect.x)
		//rect.x = (displayRect.width - windowRect.width) * alignX + displayRect.x;
		//rect.y = (displayRect.height - windowRect.height) * alignY + displayRect.y ;
		return rect
	}
}