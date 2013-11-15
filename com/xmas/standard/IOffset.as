package com.xmas.standard
{
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public interface IOffset
	{
		function set offsetY(value:int):void;
		function get offsetY():int;
		function set offsetX(value:int):void;
		function get offsetX():int;
		function offset(offsetX:int, offsetY:int):void;
	}
}