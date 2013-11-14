package com.xmas.standard
{
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public interface IAlign
	{
		function set alignY(value:Number):void;
		function set alignX(value:Number):void;
		function get alignY():Number;
		function get alignX():Number;
		function align(alignX:Number, alignY:Number):void;
	}
}