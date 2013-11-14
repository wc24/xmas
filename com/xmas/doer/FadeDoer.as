package com.xmas.doer
{
	import com.xmas.standard.ICanDestroy;
	import com.xmas.standard.IEasy;
	import com.xmas.utils.bound;
	import com.xmas.utils.removeFromParent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author 蓝面包qq:95506822
	 */
	public class FadeDoer implements ICanDestroy
	{
		public var container:DisplayObjectContainer;
		private var target:DisplayObject;
		private var value:Number;
		static private var pool:Dictionary = new Dictionary();
		
		public function FadeDoer(target:DisplayObject, container:DisplayObjectContainer = null)
		{
			this.target = target;
			this.container = container;
		}
		
		public function show(value:Number):void
		{
			this.value = value;
			if (target.parent != container)
			{
				container.addChild(target);
			}
			if (target.alpha < 1)
			{
				target.addEventListener(Event.ENTER_FRAME, target_enterFrame);
				target_enterFrame(null)
			}
		}
		
		public function hide(value:Number):void
		{
			if (target.parent != null)
			{
				this.value = -value;
				if (target.alpha > 0)
				{
					target.addEventListener(Event.ENTER_FRAME, target_enterFrame);
					target_enterFrame(null)
				}
			}
		}
		
		public function destroy():void
		{
			target.removeEventListener(Event.ENTER_FRAME, target_enterFrame);
			target = null;
			container = null;
		}
		
		private function target_enterFrame(e:Event):void
		{
			target.alpha += value;
			if (target.alpha >= 1)
			{
				target.alpha = 1;
				target.removeEventListener(Event.ENTER_FRAME, target_enterFrame);
			}
			else if (target.alpha <= 0)
			{
				target.alpha = 0;
				target.removeEventListener(Event.ENTER_FRAME, target_enterFrame);
				removeFromParent(target);
			}
		}
		
		static public function show(target:DisplayObject, value:Number, container:Sprite):FadeDoer
		{
			var fadeDoer:FadeDoer
			if (pool[target] == null)
			{
				fadeDoer = new FadeDoer(target, container);
				pool[target] = fadeDoer;
			}
			else
			{
				fadeDoer = pool[target];
				fadeDoer.container = container;
			}
			fadeDoer.show(value)
			return fadeDoer
		}
		
		static public function kill(target:DisplayObject):void
		{
			if (pool[target])
			{
				pool[target].destroy();
				delete pool[target]
			}
		}
		
		static public function hide(target:DisplayObject, value:Number):FadeDoer
		{
			var fadeDoer:FadeDoer
			if (pool[target] == null)
			{
				fadeDoer = new FadeDoer(target);
				pool[target] = fadeDoer;
			}
			else
			{
				fadeDoer = pool[target];
			}
			fadeDoer.hide(value)
			return fadeDoer
		}
	}
}