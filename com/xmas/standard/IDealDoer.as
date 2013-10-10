package com.xmas.standard {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public interface IDealDoer {
		function get boundRect():Rectangle
		function set boundRect(value:Rectangle):void
		function add(target:IRectangle):void
		function addDisplay(target:DisplayObject):void
		function addContainer(target:DisplayObjectContainer):void
		function update()
	}
}