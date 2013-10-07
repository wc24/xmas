package com.xmas.standard {
	import flash.display.DisplayObject;
	public interface IDisplay {
		function show():void;
		function hide():void;
		function get display():DisplayObject;
	}
}