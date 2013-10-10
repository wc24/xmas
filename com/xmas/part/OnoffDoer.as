package com.xmas.part {
	import com.xmas.standard.IGroupItem;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class OnoffDoer extends PartDoer implements IGroupItem {
		private var _groupId:int
		private var area:Sprite;
		private var _state:Boolean;
		static public const ON:String = "on";
		static public const OFF:String = "off";
		
		public function OnoffDoer(area:Sprite) {
			start(area)
		}
		
		public function start(area:Sprite):void {
			if (area) {
				this.area = area;
				activate()
			}
		}
		
		override public function activate():void {
			super.activate();
			area.buttonMode = true;
			area.mouseEnabled = true;
			area.mouseChildren = false;
			area.useHandCursor = true;
			area.addEventListener(MouseEvent.CLICK, area_click);
			push()
		}
		
		public function push():void {
			_state = !_state;
			change()
		}
		
		private function area_click(e:MouseEvent):void {
			push()
		}
		
		override public function deactivate():void {
			area.removeEventListener(MouseEvent.CLICK, area_click);
		}
		
		override public function destroy():void {
			super.destroy();
			area = null;
		}
		
		public function get state():String {
			return _state;
		}
		
		public function get groupId():int {
			return _groupId;
		}
		
		public function set groupId(value:int):void {
			_groupId = value;
		}
	}
}