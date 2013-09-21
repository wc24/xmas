package com.xmas.brick.core {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class BrickEvent extends Event {
		static public const DRAW:String = "draw";
		
		public function BrickEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		
		}
	
	}

}