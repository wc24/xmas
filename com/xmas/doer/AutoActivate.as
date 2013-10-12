package com.xmas.doer {
	import com.xmas.standard.IEasy;
	import flash.display.DisplayObject;
	import flash.events.Event;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class AutoActivate implements IEasy {
		private var _target:DisplayObject;
		private var easy:IEasy;
		public function AutoActivate(easy:IEasy, target:DisplayObject=null) {
			this.easy = easy;
			this.target = target;
		}
		/* INTERFACE com.xmas.standard.IEasy */
		public function deactivate():void {
			_target.removeEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
			_target.removeEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
		}
		public function activate():void {
			_target.addEventListener(Event.ADDED_TO_STAGE, target_addedToStage);
			_target.addEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStage);
		}
		private function target_removedFromStage(e:Event):void {
			easy.deactivate()
		}
		private function target_addedToStage(e:Event):void {
			easy.activate()
		}
		public function destroy():void {
			deactivate()
			_target = null;
			easy = null;
		}
		public function get target():DisplayObject {
			return _target;
		}
		public function set target(value:DisplayObject):void {
			if (_target != value) {
				if (_target != null) {
					deactivate()
				}
				_target = value;
				if (value != null) {
					activate()
					if (_target.stage) {
						easy.activate();
					}
				}
			}
		}
	}
}