package com.xmas.utils {
	import com.xmas.core.XmasError;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.original.PlaneMoveVo;
	import com.xmas.plus.PlusMouseDrag;
	import com.xmas.standard.IDragObject;
	import flash.display.InteractiveObject;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Drager extends PlusMouseDrag {
		private var dragObject:IDragObject;
		private var planeMoveVo:PlaneMoveVo
		private var _boundRect:Rectangle;
		private var _useHandCursor:Boolean;
		private var _boundStage:Boolean;
		
		public function Drager(dispatcher:EventDispatcher = null) {
			super(dispatcher);
			planeMoveVo = new PlaneMoveVo();
			//_useHandCursor = true;
		}
		
		/**
		 * 开始执行
		 * @param	dragObject 拖动目标
		 * @param	area 拖动区域
		 */
		public function start(dragObject:IDragObject, area:InteractiveObject):void {
			this.dragObject = dragObject;
			interactiveObject = area;
		}
		
		override public function activate():void {
			super.activate()
			if (stage == null) {
				throw(new XmasError(1)); //
			}
			upCursor()
			addEventListener(PlusMouseEvent.DRAG, drag);
			addEventListener(PlusMouseEvent.FREE, free);
			interactiveObject.addEventListener(MouseEvent.MOUSE_DOWN, down);
		}
		
		private function down(e:MouseEvent):void {
			planeMoveVo.start(stage.mouseX, stage.mouseY);
			planeMoveVo.x = dragObject.x;
			planeMoveVo.y = dragObject.y;
		}
		
		private function free(e:PlusMouseEvent):void {
		}
		
		private function drag(e:PlusMouseEvent):void {
			planeMoveVo.end(boundStage ? bound(stage.mouseX, 0, stage.stageWidth) : stage.mouseX, boundStage ? bound(stage.mouseY, 0, stage.stageHeight) : stage.mouseY);
			dragObject.x = planeMoveVo.x;
			dragObject.y = planeMoveVo.y;
			upbound();
		}
		
		//-----------------------------
		public function upbound():void {
			if (boundRect != null) {
				checkUse()
				dragObject.x = bound(dragObject.x, _boundRect.left, _boundRect.right);
				dragObject.y = bound(dragObject.y, _boundRect.top, _boundRect.bottom);
			}
		}
		
		public function get boundStage():Boolean {
			return _boundStage;
		}
		
		public function set boundStage(value:Boolean):void {
			_boundStage = value;
		}
		
		private function checkUse():void {
			if (interactiveObject == null) {
				throw(new XmasError(2)); //
			}
		}
		
		public function get useHandCursor():Boolean {
			return _useHandCursor;
		}
		
		public function set useHandCursor(value:Boolean):void {
			if (_useHandCursor != value) {
				_useHandCursor = value;
				upCursor()
			}
		}
		
		public function upCursor():void {
			checkUse()
			if (_useHandCursor) {
				interactiveObject.addEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
				interactiveObject.addEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
			} else {
				interactiveObject.removeEventListener(MouseEvent.MOUSE_OVER, area_mouseOver);
				interactiveObject.removeEventListener(MouseEvent.MOUSE_OUT, area_mouseOut);
			}
		}
		
		public function get boundRect():Rectangle {
			return _boundRect;
		}
		
		public function set boundRect(value:Rectangle):void {
			_boundRect = value;
			upbound();
		}
		
		private function area_mouseOut(e:MouseEvent):void {
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		private function area_mouseOver(e:MouseEvent):void {
			Mouse.cursor = MouseCursor.HAND;
		}
	}
}