package com.xmas.part {
	import com.xmas.doer.LocationDoer;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.utils.bound;
	import com.xmas.utils.Drager;
	import flash.display.InteractiveObject;
	import flash.geom.Rectangle;
	[Event(name="drag",type="com.xmas.events.PlusMouseEvent")]
	[Event(name="free",type="com.xmas.events.PlusMouseEvent")]
	
	public class SlidDoer extends PartDoer {
		private var area:InteractiveObject;
		private var drager:Drager;
		private var tutor:LocationDoer;
		private var lastX:Number;
		private var lastY:Number;
		
		public function SlidDoer(area:InteractiveObject,boundRect:Rectangle) {
			this.area = area;
			drager = new Drager(this);
			tutor = new LocationDoer(area)
			drager.start(tutor, area);
			this.boundRect = boundRect;
			//drager.useHandCursor = true;
			drager.addEventListener(PlusMouseEvent.DRAG, drager_drag);
		}
		
		private function drager_drag(e:PlusMouseEvent):void {
			if (lastX != tutor.x || lastY != tutor.y) {
				change();
			}
			lastX = tutor.x
			lastY = tutor.y
		}
		
		public function get boundRect():Rectangle {
			return drager.boundRect;
		}
		
		public function set boundRect(value:Rectangle):void {
			drager.boundRect = value;
			change();
		}
		
		public function get scaleX():Number {
			return (tutor.x - drager.boundRect.x) / drager.boundRect.width;
		}
		
		public function set scaleX(value:Number):void {
			tutor.x = bound(value, 0, 1) * drager.boundRect.width + drager.boundRect.x;
			if (lastX != tutor.x) {
				change();
			}
			lastX = tutor.x
		}
		
		public function get scaleY():Number {
			return (tutor.y - drager.boundRect.y) / drager.boundRect.height;
		}
		
		public function set scaleY(value:Number):void {
			tutor.y = bound(value, 0, 1) * drager.boundRect.height + drager.boundRect.y;
			if (lastY != tutor.y) {
				change();
			}
			lastY = tutor.y
		}
	}
}