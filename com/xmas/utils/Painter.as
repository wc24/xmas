package com.xmas.utils {
	import flash.display.Graphics;
	/**
	 * 画圆
	 * @example
	 * 画一个圆形
	 * <listing version="3.0">
	   package
	   {
	   import easy.core.utils.Painter;
	   import flash.display.Graphics;
	   import flash.display.Sprite;
	
	   public class Main extends Sprite
	   {
	   public function Main():void
	   {
	   var sa:Sprite = new Sprite();
	   Painter.drawCircle(sa.graphics, 30, 0xff00ff, 1, 100, 100);
	   addChild(sa);
	   }
	   }
	   }</listing>
	 */
	public class Painter {
		/**
		 * 画圆
		 * @param	graphics			一组可用来创建矢量形状的方法,是一个 Graphics 对象
		 * @param	radius			所要画的圆的半径
		 * @param	color			所要画的圆的颜色
		 * @param	alpha			所要画的圆的透明度
		 * @param	x			所要画的圆的横坐标
		 * @param	y			所要画的圆的纵坐标
		 */
		static public function drawCircle(graphics:Graphics, radius:Number = 50, color:uint = 0, alpha:Number = 1, x:Number = 0, y:Number = 0):void {
			graphics.beginFill(color, alpha);
			graphics.drawCircle(x, y, radius);
			graphics.endFill();
		}
		static public function drawRect(graphics:Graphics, width:int, height:int, color:uint = 0, alpha:Number = 1, x:Number = 0, y:Number = 0):void {
			graphics.beginFill(color, alpha);
			graphics.drawRect(x, y, width, height);
			graphics.endFill();
		}
		static public function drawCenterRect(graphics:Graphics, width:int, height:int, color:uint = 0):void {
			graphics.beginFill(color, 1);
			graphics.drawRect(-width / 2, -height / 2, width, height);
			graphics.endFill();
		}
	}
}