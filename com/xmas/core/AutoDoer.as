package com.xmas.core {
	import com.xmas.standard.IEasy;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * 开发类
	 * @author 蓝面包
	 */
	public class AutoDoer extends Doer implements IEasy {
		private var _target:DisplayObject;
		
		public function AutoDoer(dispatcher:EventDispatcher = null) {
			super(dispatcher);
		}
		
		private function target_removedFromStage(e:Event):void {
			deactivate()
		}
		
		private function target_addedToStage(e:Event):void {
			activate()
		}
		
		/* INTERFACE com.xmas.core.standard.IEasy */
		public function deactivate():void {
		}
		
		public function activate():void {
		}
		
		public function destroy():void {
			deactivate()
			dispatcher = null;
			target = null;
		}
		
		public function get stage():Stage {
			return _target.stage;
			//如果_target为空 或在_target.stage不存在 说明你在 失效的情况下继续使用类;
		}
		
		public function get target():DisplayObject {
			return _target;
		}
		
		public function set target(value:DisplayObject):void {
			if (_target != value) {
				if (_target != null) {
					_target.removeEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
					_target.removeEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
				}
				_target = value;
				if (value != null) {
					_target.addEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
					_target.addEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
					trace(stage)
					if (stage) {
						activate()
					}
				}
			}
		}
	}
}