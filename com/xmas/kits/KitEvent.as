package com.xmas.kits {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class KitEvent extends Event {
		static public const DRAW:String = "draw";
		
		public function KitEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}