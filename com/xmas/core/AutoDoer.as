package com.xmas.core {
	import com.xmas.doer.AutoActivate;
	import com.xmas.standard.IEasy;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	/**
	 * 开发类
	 * @author 蓝面包
	 */
	public class AutoDoer extends Doer implements IEasy {
		private var autoActivate:AutoActivate;
		public function AutoDoer(dispatcher:IEventDispatcher = null) {
			super(dispatcher);
			autoActivate = new AutoActivate(this);
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
			autoActivate.destroy();
			autoActivate = null;
		}
		public function get stage():Stage {
			return autoActivate.target.stage;
			//如果_target为空 或在_target.stage不存在 说明你在 失效的情况下继续使用类;
		}
		public function get target():DisplayObject {
			return autoActivate.target;
		}
		public function set target(value:DisplayObject):void {
			autoActivate.target = value;
		}
	}
}