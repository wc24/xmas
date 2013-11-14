package com.xmas.utils
{
	import flash.system.Capabilities;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public function  autoTextFormat():TextFormat
	{
		switch (Capabilities.os)
		{
			case "Windows XP": 
			case "Windows 98": 
			case "Windows 2000": 
			case "Windows ME": 
				return new TextFormat("宋体", 12);
			case "Windows 8": 
			case "Windows 7": 
			case "Windows Vista": 
				return new TextFormat("Microsoft YaHei", 12);
				break;
			default: 
				return new TextFormat("null", 12);
		}
	}
}