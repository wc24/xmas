package com.xmas.utils {
	import com.xmas.core.XmasError;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.standard.IDragObject;
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	[Event(name="drag", type="com.xmas.utils.DragerEvent")]
	public class NODrager extends EventDispatcher {
		/**
		 * 限制区域
		 */
		public var boundRect:Rectangle;
		private var _useHandCursor:Boolean;
		private var changeX:Number;
		private var changeY:Number;
		private var area:InteractiveObject;
		private var dragObject:IDragObject;
		private var _stage:Stage;
		private var _boundStage:Boolean;
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		/**
		 * 无缓动的拖动类！
		 */
		public function NODrager(dispatcher:IEventDispatcher = null) {
			super(dispatcher);
		}
		
		/**
		 * 开始执行
		 * @param	dragObject 拖动目标
		 * @param	area 拖动区域
		 */
		//public function action(dragObject:IDragObject, area:InteractiveObject):void {
			//this.dragObject = dragObject;
			//this.area = area;
			//if (area.stage == null) {
				//area.addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			//} else {
				//area.addEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
				//activate()
			//}
		//}
		
		//public function upbound():void {
			//checkUse()
			//dragObject.x = bound(dragObject.x, boundRect.left, boundRect.right);
			//dragObject.y = bound(dragObject.y, boundRect.top, boundRect.bottom);
		//}
		//
		//public function get boundStage():Boolean {
			//return _boundStage;
		//}
		//
		//public function set boundStage(value:Boolean):void {
			//_boundStage = value;
		//}
		//
		//private function checkUse():void {
			//if (area == null) {
				//throw(new XmasError(2)); //
			//}
		//}
		//
		//public function get useHandCursor():Boolean {
			//return _useHandCursor;
		//}
		//
		//public function set useHandCursor(value:Boolean):void {
			//checkUse()
			//if (_useHandCursor != value) {
				//if (value) {
					//area.addEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
					//area.addEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
				//} else {
					//area.removeEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
					//area.removeEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
				//}
			//}
			//_useHandCursor = value;
		//}
		//
		//private function area_mouseOut(e:MouseEvent):void {
			//Mouse.cursor = MouseCursor.AUTO;
		//}
		//
		//private function area_mouseOver(e:MouseEvent):void {
			//Mouse.cursor = MouseCursor.HAND;
		//}
		
		private function this_addedToStage(e:Event):void {
			area.removeEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			area.addEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
			activate()
		}
		
		//private function activate():void {
			//if (area.stage != null) {
				//_stage = area.stage
			//} else {
				//throw(new XmasError(1)); //
			//}
			//area.addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDown);
			//_stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
			//changeX = 0
			//changeY = 0
		//}
		
		private function stage_mouseUp(e:MouseEvent):void {
			_stage.removeEventListener(Event.ENTER_FRAME, this_mouseMove);
		}
		
		private function this_mouseDown(e:MouseEvent):void {
			//changeX = _stage.mouseX;
			//changeY = _stage.mouseY;
			changeX = dragObject.x - _stage.mouseX;
			changeY = dragObject.y - _stage.mouseY;
			_stage.addEventListener(Event.ENTER_FRAME, this_mouseMove);
		}
		
		private function this_mouseMove(e:Event):void {
			_mouseX = boundStage ? bound(_stage.mouseX, 0, _stage.stageWidth) : _stage.mouseX;
			_mouseY = boundStage ? bound(_stage.mouseY, 0, _stage.stageHeight) : _stage.mouseY;
			if (_mouseX != changeX || _mouseY != changeY) {
				if (boundRect == null) {
					//dragObject.x = dragObject.x + _mouseX - changeX
					//dragObject.y = dragObject.y + _mouseY - changeY;
					dragObject.x = _mouseX + changeX
					dragObject.y = _mouseY + changeY;
				} else {
					//dragObject.x = bound(dragObject.x + _mouseX - changeX, boundRect.left, boundRect.right);
					//dragObject.y = bound(dragObject.y + _mouseY - changeY, boundRect.top, boundRect.bottom);
					dragObject.x = bound(_mouseX + changeX, boundRect.left, boundRect.right);
					dragObject.y = bound(_mouseY + changeY, boundRect.top, boundRect.bottom);
				}
				//changeX = _mouseX;
				//changeY = _mouseY;
				
				dispatchEvent(new PlusMouseEvent(PlusMouseEvent.DRAG,new MouseEvent("",true,false,dragObject.x,dragObject.y)));
			}
		}
		
		private function deactivate():void {
			area.removeEventListener(MouseEvent.MOUSE_DOWN, this_mouseDown);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
			_stage = null;
		}
		
		private function this_removedFromStage(e:Event):void {
			area.removeEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
			area.addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			deactivate()
		}
	}
}