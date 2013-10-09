package com.xmas.part {
	import com.xmas.doer.LocationDoer;
	import com.xmas.events.PlusMouseEvent;
	import com.xmas.original.PlaneScaleVo;
	import com.xmas.utils.Drager;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class SlidDoer extends PartDoer {
		private var area:Sprite;
		private var drager:Drager;
		private var tutor:LocationDoer;
		
		public function SlidDoer(area:Sprite) {
			this.area = area;
			drager = new Drager();
			tutor = new LocationDoer(area)
			drager.start(tutor, area);
			//drager.useHandCursor = true;
		}
		
		public function get boundRect():Rectangle {
			return drager.boundRect;
		}
		
		public function set boundRect(value:Rectangle):void {
			drager.boundRect = value;
		}
		
		public function get scaleX():Number {
			return (tutor.x - drager.boundRect.x) / drager.boundRect.width;
		}
		
		public function set scaleX(value:Number):void {
			tutor.x = value * drager.boundRect.width + drager.boundRect.x;
		}
		
		public function get scaleY():Number {
			return (tutor.y - drager.boundRect.y) / drager.boundRect.height;
		}
		
		public function set scaleY(value:Number):void {
			tutor.y = value * drager.boundRect.height + drager.boundRect.y;
		}
	}
}