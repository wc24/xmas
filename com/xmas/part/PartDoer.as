package com.xmas.part {
	import com.xmas.core.Doer;
	import com.xmas.standard.IEasy;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author 蓝面包
	 */
	[Event(name="change",type="flash.events.Event")]
	public class PartDoer extends Doer implements IEasy {
		private var _enabled:Boolean;
		public function PartDoer() {
		}
		public function deactivate():void {
		}
		public function activate():void {
		}
		public function destroy():void {
			deactivate()
		}
		public function get enabled():Boolean {
			return _enabled;
		}
		public function set enabled(value:Boolean):void {
			if (_enabled != value) {
				_enabled = value
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		public function change():void {
			dispatchEvent(new Event(Event.CHANGE));
		}
	}
}