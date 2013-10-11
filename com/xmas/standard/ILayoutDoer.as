package com.xmas.standard {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public interface ILayoutDoer {
		function get boundRect():Rectangle
		function set boundRect(value:Rectangle):void
		function set spaceH(value:int):void;
		function get spaceH():int;
		function set spaceV(value:int):void;
		function get spaceV():int;
		function get length():uint;
		function add(target:IRectangle):void
		function addDisplay(target:DisplayObject):IRectangle
		function addContainer(target:DisplayObjectContainer, order:Boolean = true):void
		function remove(target:Object):IRectangle
		function update():void
	}
}