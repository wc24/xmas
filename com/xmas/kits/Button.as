package com.xmas.kits {
	import com.xmas.kits.vo.ButtonVo;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Button extends Kit {
		static public const NORMAL:String = "normal";
		static public const DISABLE:String = "disable";
		static public const OVER:String = "over";
		static public const DOWN:String = "down";
		private var _buttonVo:ButtonVo;
		private var _state:String;
		private var _normalSkin:DisplayObject;
		private var _downSkin:DisplayObject;
		private var _overSkin:DisplayObject;
		private var _disableSkin:DisplayObject;
		public function Button(buttonVo:ButtonVo) {
			_buttonVo = buttonVo;
			mouseChildren = false;
			mouseEnabled = true;
			buttonMode = true;
			useHandCursor = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			_normalSkin = buttonVo.normalSkin;
			_downSkin = buttonVo.downSkin || buttonVo.overSkin || buttonVo.normalSkin;
			_overSkin = buttonVo.overSkin || buttonVo.normalSkin;
			_disableSkin = buttonVo.disableSkin || buttonVo.normalSkin;
			addChild(_normalSkin)
			addChild(_downSkin)
			addChild(_overSkin)
			addChild(_disableSkin)
			addChild(_buttonVo.label)
			state = Button.NORMAL
		}
		private function mouseDown(e:MouseEvent):void {
			state = Button.DOWN
		}
		private function mouseOut(e:MouseEvent):void {
			state = Button.NORMAL
		}
		private function mouseOver(e:MouseEvent):void {
			state = Button.OVER
		}
		override public function get enabled():Boolean {
			return super.enabled;
		}
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			_buttonVo.label.enabled = value;
			if (value) {
				state = Button.NORMAL
			} else {
				state = Button.DISABLE
			}
		}
		public function get state():String {
			return _state;
		}
		public function set state(value:String):void {
			_state = value;
			_normalSkin.visible = false;
			_downSkin.visible = false;
			_overSkin.visible = false;
			_disableSkin.visible = false;
			switch (state) {
				case Button.NORMAL: 
					_normalSkin.visible = true;
					break;
				case Button.DOWN: 
					_downSkin.visible = true;
					break;
				case Button.OVER: 
					_overSkin.visible = true;
					break;
				case Button.DISABLE: 
					_disableSkin.visible = true;
					break;
			}
		}
		public function get label():String {
			return _buttonVo.label.text;
		}
		public function set label(value:String):void {
			_buttonVo.label.text = value;
			redraw()
		}
	}
}