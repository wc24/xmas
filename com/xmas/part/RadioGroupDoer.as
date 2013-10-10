package com.xmas.part {
	import flash.events.Event;
	
	/**indeterminate
	 * ...
	 * @author 蓝面包
	 */
	public class RadioGroupDoer extends PartDoer {
		private var list:Vector.<OnoffDoer>
		private var index:int;
		
		public function RadioGroupDoer() {
			index = -1
		}
		
		public function clear():void {
			for each (var item:OnoffDoer in list) {
				item.removeEventListener(Event.CHANGE, onoffDoer_change);
				index = -1
			}
		}
		
		public function add(onoffDoer:OnoffDoer):void {
			onoffDoer.addEventListener(Event.CHANGE, onoffDoer_change);
			onoffDoer.groupId = list.length;
			list.push(onoffDoer);
		}
		
		private function onoffDoer_change(e:Event):void {
			var onoffDoer:OnoffDoer = e.target as OnoffDoer;
			index = onoffDoer.groupId;
			change();
		}
	}
}