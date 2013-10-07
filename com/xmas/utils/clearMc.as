package com.xmas.utils {
	import flash.display.DisplayObjectContainer;
	/**
	 * 从 DisplayObjectContainer 实例的子列表中删除所有的DisplayObject实例，可以指定保留不被删除实例的个数。
	 * @param target 目标容器
	 * @param spare 保留对象个数
	 * @return 目标容器
	 * @example
	 * 本示例点击舞台消除box1里的所有可视对象
	 * <listing version="3.0">
	   package
	   {
	   import easy.wc.clearMc;
	   import easy.wc.display.QuickShape;
	   import flash.display.Sprite;
	   import flash.events.MouseEvent;
	
	   public class Main extends Sprite
	   {
	   private var box1:Sprite;
	   private var box2:Sprite;
	   public function Main():void
	   {
	   box1 = new Sprite()
	   box2 = new Sprite();
	   addChild(box1)
	   addChild(box2)
	   box1.addChild(QuickShape.QRound(10, 0, 1, 20, 20))
	   box1.addChild(QuickShape.QRound(30, 0, 1, 50, 50))
	   box2.addChild(QuickShape.QRound(30, 0, 1, 100, 100))
	   stage.addEventListener(MouseEvent.CLICK, stageClickHd)
	   }
	   private function stageClickHd(e:MouseEvent):void
	   {
	   clearMc(box1)
	   }
	   }
	   }</listing>
	 */
	public function clearMc(target:DisplayObjectContainer, spare:int = 0):DisplayObjectContainer {
		while (target.numChildren > spare) {
			target.removeChildAt(0);
		}
		return target;
	}
}