package com.xmas.utils {
	import com.xmas.standard.IEasy;
	import com.xmas.standard.ISelfAdaption;
	import com.xmas.utils.bound;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	public class SelfAdaption implements IEasy {
		private var target:DisplayObject;
		private var alignRatioX:Number;
		private var alignRatioY:Number;
		private var offsetX:int;
		private var offsetY:int;
		private var boundRect:Rectangle;
		private var noBoundRect:Rectangle = new Rectangle();
		public var careSize:Boolean = true;
		public static var pool:Dictionary = new Dictionary(true);
		public function SelfAdaption(target:DisplayObject, alignRatioX:Number = 0, alignRatioY:Number = 0, offsetX:int = 0, offsetY:int = 0) {
			this.offsetY = offsetY;
			this.offsetX = offsetX;
			this.alignRatioX = bound(alignRatioX, 0, 1);
			this.alignRatioY = bound(alignRatioY, 0, 1);
			this.target = target;
			target.addEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
			target.addEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
			if (target.stage) {
				activate()
			}
		}
		public static function addDisplay(target:DisplayObject, alignRatioX:Number = 0, alignRatioY:Number = 0, offsetX:int = 0, offsetY:int = 0):SelfAdaption {
			var selfAdaption:SelfAdaption = new SelfAdaption(target, alignRatioX, alignRatioY, offsetX, offsetY);
			removeDisplay(target);
			pool[target] = selfAdaption
			return selfAdaption
		}
		public static function addDisplayDefySize(target:DisplayObject, alignRatioX:Number = 0, alignRatioY:Number = 0, offsetX:int = 0, offsetY:int = 0):SelfAdaption {
			var selfAdaption:SelfAdaption = SelfAdaption.addDisplay(target, alignRatioX, alignRatioY, offsetX, offsetY)
			selfAdaption.careSize = false;
			return selfAdaption
		}
		public static function getSelfAdaption(target:DisplayObject):SelfAdaption {
			return pool[target] as SelfAdaption
		}
		public static function clear():void {
			pool = new Dictionary(true);
		}
		public static function removeDisplay(target:DisplayObject):void {
			if (getSelfAdaption(target) != null) {
				getSelfAdaption(target).destroy();
			}
			delete pool[target]
		}
		/* INTERFACE com.xmas.standard.IEasy */
		public function deactivate():void {
			target.stage.removeEventListener(Event.RESIZE, resize);
			target.removeEventListener(Event.CHANGE, resize);
		}
		public function activate():void {
			target.stage.addEventListener(Event.RESIZE, resize);
			target.addEventListener(Event.CHANGE, resize);
			update()
		}
		public function destroy():void {
			deactivate()
			target.removeEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
			target.removeEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
			target = null;
		}
		private function update():void {
			if (target is ISelfAdaption) {
				(target as ISelfAdaption).upStageSize(target.stage.stageWidth, target.stage.stageHeight);
			}
			boundRect = careSize ? target.getBounds(target) : noBoundRect;
			target.x = (target.stage.stageWidth - boundRect.width - boundRect.x * 2) * alignRatioX + offsetX;
			target.y = (target.stage.stageHeight - boundRect.height - boundRect.y * 2) * alignRatioY + offsetY;
		}
		private function resize(e:Event):void {
			update()
		}
		private function target_removedFromStage(e:Event):void {
			deactivate()
		}
		private function target_addedToStage(e:Event):void {
			activate()
		}
	}
}