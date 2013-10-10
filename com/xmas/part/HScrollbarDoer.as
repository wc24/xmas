package com.xmas.part {
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.plus.PlusMousePress;
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class HScrollbarDoer extends PartDoer {
		private var downPress:PlusMousePress;
		private var upPress:PlusMousePress;
		private var slidDoer:SlidDoer;
		public var lineNumber:uint;
		private var _wheel:InteractiveObject;
		private var _long:uint;
		
		public function HScrollbarDoer(barSkin:InteractiveObject, downSkin:InteractiveObject, upSkin:InteractiveObject) {
			lineNumber = 20;
			_long = 100;
			slidDoer = new SlidDoer(barSkin, new Rectangle(0, 20, 0, long))
			slidDoer.addEventListener(Event.CHANGE, slidDoer_change);
			downPress = new PlusMousePress();
			downPress.interactiveObject = downSkin;
			downPress.addEventListener(PlusMouseEvent.LONG_PRESSING, downSkin_mouseDown);
			downSkin.addEventListener(MouseEvent.MOUSE_DOWN, downSkin_mouseDown);
			upPress = new PlusMousePress();
			upPress.interactiveObject = upSkin;
			upPress.addEventListener(PlusMouseEvent.LONG_PRESSING, upSkin_mouseDown);
			upSkin.addEventListener(MouseEvent.MOUSE_DOWN, upSkin_mouseDown);
		}
		
		private function slidDoer_change(e:Event):void {
			change();
		}
		
		private function upSkin_mouseDown(e:MouseEvent):void {
			slidDoer.scaleY -= 1 / lineNumber;
		}
		
		private function downSkin_mouseDown(e:MouseEvent):void {
			slidDoer.scaleY += 1 / lineNumber;
		}
		
		public function get scale():Number {
			return slidDoer.scaleY;
		}
		
		public function set scale(value:Number):void {
			slidDoer.scaleY = value;
		}
		
		public function get long():uint {
			return _long;
		}
		
		public function set long(value:uint):void {
			_long = value;
			var keep:Number = slidDoer.scaleY;
			slidDoer.boundRect.height = _long;
			slidDoer.scaleY = keep
		}
		
		public function get wheel():InteractiveObject {
			return _wheel;
		}
		
		public function set wheel(value:InteractiveObject):void {
			if (value != _wheel) {
				if (_wheel != null) {
					_wheel.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheel);
				}
				if (value != null) {
					value.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheel);
				}
				_wheel = value;
			}
		}
		
		private function mouseWheel(e:MouseEvent):void {
			if (e.delta > 0) {
				slidDoer.scaleY -= 1 / lineNumber;
			} else {
				slidDoer.scaleY += 1 / lineNumber;
			}
		}
	}
}