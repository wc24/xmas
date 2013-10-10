package com.xmas.layout {
	import com.xmas.doer.AutoActivate;
	import com.xmas.standard.IAdaptionStage;
	import com.xmas.standard.IEasy;
	import com.xmas.utils.bound;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	public class AdaptionStage implements IEasy {
		private var target:DisplayObject;
		private var RatioH:Number;
		private var RatioV:Number;
		private var _offsetX:int;
		private var _offsetY:int;
		private var noBoundRect:Rectangle = new Rectangle();
		private var autoActivate:AutoActivate;
		public static var pool:Dictionary = new Dictionary(true);
		
		public function AdaptionStage(target:DisplayObject, RatioH:Number = 0, RatioV:Number = 0, offsetX:int = 0, offsetY:int = 0) {
			_offsetY = offsetY;
			_offsetX = offsetX;
			this.RatioH = bound(RatioH, 0, 1);
			this.RatioV = bound(RatioV, 0, 1);
			this.target = target;
			autoActivate = new AutoActivate(this, target)
		}
		
		public static function addDisplay(target:DisplayObject, RatioH:Number = 0, RatioV:Number = 0, offsetX:int = 0, offsetY:int = 0):AdaptionStage {
			var adaptionStage:AdaptionStage = new AdaptionStage(target, RatioH, RatioV, offsetX, offsetY);
			removeDisplay(target);
			pool[target] = adaptionStage
			return adaptionStage
		}
		
		public static function getAdaptionStage(target:DisplayObject):AdaptionStage {
			return pool[target] as AdaptionStage
		}
		
		public static function clear():void {
			pool = new Dictionary(true);
		}
		
		public static function removeDisplay(target:DisplayObject):void {
			if (getAdaptionStage(target) != null) {
				getAdaptionStage(target).destroy();
			}
			delete pool[target]
		}
		
		/* INTERFACE com.xmas.standard.IEasy */
		public function deactivate():void {
			target.stage.removeEventListener(Event.RESIZE, resize);
		}
		
		public function activate():void {
			target.stage.addEventListener(Event.RESIZE, resize);
			update()
		}
		
		public function destroy():void {
			deactivate()
			autoActivate.destroy();
			target = null;
		}
		
		private function update():void {
			target.x = target.stage.stageWidth * RatioH + _offsetX;
			target.y = target.stage.stageHeight * RatioV + _offsetY;
		}
		
		private function resize(e:Event):void {
			if (target is IAdaptionStage) {
				(target as IAdaptionStage).upStageSize(target.stage.stageWidth, target.stage.stageHeight);
			}
			update()
		}
		
		public function offsetTo(offsetX:int, offsetY:int):void {
			_offsetX = offsetX;
			_offsetY = offsetY;
			update()
		}
		
		public function offset(x:int, y:int):void {
			_offsetX += x;
			_offsetY += y;
			update()
		}
	}
}