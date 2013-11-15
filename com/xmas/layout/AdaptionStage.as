package com.xmas.layout
{
	import com.xmas.doer.AutoActivate;
	import com.xmas.standard.IAdaptionStage;
	import com.xmas.standard.IAlign;
	import com.xmas.standard.IEasy;
	import com.xmas.standard.IOffset;
	import com.xmas.utils.bound;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	public class AdaptionStage implements IEasy, IAlign, IOffset
	{
		private var target:DisplayObject;
		private var _alignX:Number;
		private var _alignY:Number;
		private var _offsetX:int;
		private var _offsetY:int;
		private var noBoundRect:Rectangle = new Rectangle();
		private var autoActivate:AutoActivate;
		public var careSelf:Boolean = false;
		public static var pool:Dictionary = new Dictionary(true);
		
		public function AdaptionStage(target:DisplayObject, alignX:Number = 0, alignY:Number = 0, offsetX:int = 0, offsetY:int = 0)
		{
			_offsetY = offsetY;
			_offsetX = offsetX;
			this.alignX = alignX;
			this.alignY = alignY;
			this.target = target;
			autoActivate = new AutoActivate(this, target)
		}
		
		public static function addDisplay(target:DisplayObject, alignX:Number = 0, alignY:Number = 0, offsetX:int = 0, offsetY:int = 0):AdaptionStage
		{
			var adaptionStage:AdaptionStage = new AdaptionStage(target, alignX, alignY, offsetX, offsetY);
			removeDisplay(target);
			pool[target] = adaptionStage
			return adaptionStage
		}
		
		public static function addDisplayCareSelf(target:DisplayObject, alignX:Number = 0, alignY:Number = 0, offsetX:int = 0, offsetY:int = 0):AdaptionStage
		{
			var adaptionStage:AdaptionStage = new AdaptionStage(target, alignX, alignY, offsetX, offsetY);
			removeDisplay(target);
			pool[target] = adaptionStage
			adaptionStage.careSelf = true;
			return adaptionStage
		}
		
		public static function getAdaptionStage(target:DisplayObject):AdaptionStage
		{
			return pool[target] as AdaptionStage
		}
		
		public static function clear():void
		{
			pool = new Dictionary(true);
		}
		
		public static function removeDisplay(target:DisplayObject):void
		{
			if (getAdaptionStage(target) != null)
			{
				getAdaptionStage(target).destroy();
			}
			delete pool[target]
		}
		
		/* INTERFACE com.xmas.standard.IEasy */
		public function deactivate():void
		{
			target.stage.removeEventListener(Event.RESIZE, resize);
		}
		
		public function activate():void
		{
			target.stage.addEventListener(Event.RESIZE, resize);
			resize()
		}
		
		public function destroy():void
		{
			deactivate()
			autoActivate.destroy();
			target = null;
		}
		
		public function update():void
		{
			if (careSelf)
			{
				target.x = (target.stage.stageWidth - target.width) * alignX + _offsetX;
				target.y = (target.stage.stageWidth - target.height) * alignY + _offsetY;
			}
			else
			{
				target.x = target.stage.stageWidth * alignX + _offsetX;
				target.y = target.stage.stageHeight * alignY + _offsetY;
			}
		}
		
		private function resize(e:Event = null):void
		{
			if (target is IAdaptionStage)
			{
				(target as IAdaptionStage).upStageSize(target.stage.stageWidth, target.stage.stageHeight);
			}
			update()
		}
		
		public function reset(alignX:Number = 0, alignY:Number = 0, offsetX:int = 0, offsetY:int = 0):void
		{
			_alignX = bound(alignX, 0, 1);
			_alignY = bound(alignY, 0, 1);
			_offsetX = offsetX;
			_offsetY = offsetY;
			update()
		}
		
		/* INTERFACE com.xmas.standard.IAlign */
		public function align(alignX:Number, alignY:Number):void
		{
			_alignX = bound(alignX, 0, 1);
			_alignY = bound(alignY, 0, 1);
			updata()
		}
		
		public function offset(offsetX:int, offsetY:int):void
		{
			_offsetX = offsetX;
			_offsetY = offsetY;
			updata()
		}
		
		public function get offsetX():int
		{
			return _offsetX;
		}
		
		public function set offsetX(value:int):void
		{
			_offsetX = value;
			update()
		}
		
		public function get offsetY():int
		{
			return _offsetY;
		}
		
		public function set offsetY(value:int):void
		{
			_offsetY = value;
			update()
		}
		
		public function get alignX():Number
		{
			return _alignX;
		}
		
		public function set alignX(value:Number):void
		{
			_alignX = bound(value, 0, 1);
			update()
		}
		
		public function get alignY():Number
		{
			return _alignY;
		}
		
		public function set alignY(value:Number):void
		{
			_alignY = bound(value, 0, 1);
			update()
		}
	}
}