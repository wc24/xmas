package com.xmas.utils
{
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public function getOriginalRect(displayObject:DisplayObject):Rectangle
	{
		//var rect:Rectangle = displayObject.transform.pixelBounds
		//trace(rect.x)
		//rect.x /= displayObject.transform.concatenatedMatrix.a
		//rect.y /= displayObject.transform.concatenatedMatrix.d
		//rect.width /= displayObject.transform.concatenatedMatrix.a
		//rect.height /= displayObject.transform.concatenatedMatrix.d
		//return rect;
		var transform:Transform = displayObject.transform;
		var currentMatrix:Matrix = transform.matrix;
		var toGlobalMatrix:Matrix = transform.concatenatedMatrix;
		toGlobalMatrix.invert();
		transform.matrix = toGlobalMatrix; 
		var rect:Rectangle = transform.pixelBounds.clone(); 
		transform.matrix = currentMatrix;
		return rect; 
	}
}