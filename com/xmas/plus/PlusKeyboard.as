package com.xmas.plus {
	import com.xmas.core.AutoDoer;
	import com.xmas.events.PlusKeyboardEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * keyPressDown 键盘按下事件，只响应第一次按下，要弹开按键后再次按下才有效。(旧版要改)
	 * @eventType easy.wc.events.PlusKeyboardEvent.KEY_PRESS_DOWN
	 */
	[Event(name="keyPressDown",type="com.xmas.events.PlusKeyboardEvent")]
	/**
	 * keyPressUp 键盘弹开事件，当舞台失去焦点时也会响应弹开事件。(旧版要改)
	 * @eventType easy.wc.events.PlusKeyboardEvent.KEY_PRESS_UP
	 */
	[Event(name="keyPressUp",type="com.xmas.events.PlusKeyboardEvent")]
	
	/**
	 * 代理并加强了键盘事件，添加了压下，和放开事件跟普通的区别在于当一直为按下状态时它不会反复触发压下事件(旧版要改)
	 * @see easy.wc.events.PlusKeyboardEvent PlusKeyboardEvent
	 * @example
	 * 此示例用键盘上的方向键控制小球移动(旧版要改)
	 * <listing version="3.0">
	   package
	   {
	   import easy.core.bound;
	   import easy.core.display.QuickSprite;
	   import easy.core.events.PlusKeyboardEvent;
	   import easy.core.plus.PlusKeyboard;
	   import easy.core.utils.OnFrame;
	   import flash.display.Sprite;
	
	   public class Main extends Sprite
	   {
	   private var angle:Number
	   private var onFrame:OnFrame;
	   private var ball:Sprite;
	   private var speed:Number;
	   private var keyDoer:PlusKeyboard;
	   private var speedX:Number;
	   private var speedY:Number;
	   public function Main():void
	   {
	   ball = QuickSprite.QRound();
	   speed = 5
	   speedX = 0;
	   speedY = 0;
	   addChild(ball)
	   keyDoer = new PlusKeyboard()
	   keyDoer.activateListeners(stage);
	   keyDoer.addEventListener(PlusKeyboardEvent.KEY_PRESS_DOWN, changeKey)
	   keyDoer.addEventListener(PlusKeyboardEvent.KEY_PRESS_UP, changeKey)
	   onFrame = new OnFrame(OnFrameHd)
	   onFrame.start();
	   OnFrameHd();
	   }
	   private function OnFrameHd():void
	   {
	   ball.x = bound(ball.x + speedX, 50, 600)
	   ball.y = bound(ball.y + speedY, 50, 480)
	   }
	   private function changeKey(e:PlusKeyboardEvent):void
	   {
	   if (keyDoer.keys["37"])
	   {
	   speedX = -speed;
	   }
	   else if (keyDoer.keys["39"])
	   {
	   speedX = speed;
	   }
	   else
	   {
	   speedX = 0;
	   }
	   if (keyDoer.keys["38"])
	   {
	   speedY = -speed;
	   }
	   else if (keyDoer.keys["40"])
	   {
	   speedY = speed;
	   }
	   else
	   {
	   speedY = 0;
	   }
	   }
	   }
	   }</listing>
	 */
	public class PlusKeyboard extends AutoDoer {
		private var _keys:Object = new Object();
		private var _rely:DisplayObjectContainer;
		
		public function PlusKeyboard(target:DisplayObject) {
			this.target = target;
		}
		
		/**
		 * 破坏自身无法重复使用！
		 */
		override public function destroy():void {
			_keys = null;
			_rely = null;
			super.destroy();
		}
		
		override public function deactivate():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
			stage.removeEventListener(Event.DEACTIVATE, stage_deactivate);
		}
		
		/**
		 * 开始工作。需要依靠舞台才能进步工作。
		 * @param 所要依靠的舞台
		 */
		override public function activate():void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
			stage.addEventListener(Event.DEACTIVATE, stage_deactivate);
		}
		
		private function stage_deactivate(e:Event):void {
			for (var name:String in keys) {
				if (keys[name]) {
					keys[name] = false;
					this.dispatchEvent(new PlusKeyboardEvent(PlusKeyboardEvent.KEY_PRESS_UP, new KeyboardEvent("", true, false, 0, uint(name))));
				}
			}
		}
		
		private function stage_keyUp(e:KeyboardEvent):void {
			keys[e.keyCode] = false;
			this.dispatchEvent(new PlusKeyboardEvent(PlusKeyboardEvent.KEY_PRESS_UP, e));
		}
		
		private function stage_keyDown(e:KeyboardEvent):void {
			if (!keys[e.keyCode]) {
				keys[e.keyCode] = true;
				this.dispatchEvent(new PlusKeyboardEvent(PlusKeyboardEvent.KEY_PRESS_DOWN, e));
			}
		}
		
		/**
		 * 按键键值集合，按下键为true，弹开键为flase
		 */
		public function get keys():Object {
			return _keys;
		}
	}
}