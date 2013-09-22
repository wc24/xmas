package com.xmas.kits {
	import com.xmas.kits.vo.SliderVo;
	import com.xmas.utils.Drager;
	import com.xmas.utils.DragerEvent;
	import com.xmas.utils.Tutor;
	import flash.events.Event;
	import flash.geom.Rectangle;
	[Event(name="drag",type="com.xmas.utils.DragerEvent")]
	public class Slider extends Kit {
		private var _sliderVo:SliderVo;
		private var _drager:Drager;
		private var _tutor:Tutor;
		public function Slider(sliderVo:SliderVo) {
			_sliderVo = sliderVo;
			_drager = new Drager();
			_drager.boundRect = new Rectangle(0, 0, sliderVo.width, sliderVo.height);
			_tutor = new Tutor(sliderVo.width, sliderVo.height);
			_drager.action(_tutor, sliderVo.slip);
			_drager.addEventListener(DragerEvent.DRAG, drager_drag);
			addChild(sliderVo.slip);
		}
		private function drager_drag(e:DragerEvent):void {
			upSlip()
			dispatchEvent(DragerEvent(e))
		}
		public function upSlip():void {
			_sliderVo.slip.x = _tutor.x;
			_sliderVo.slip.y = _tutor.y;
		}
		public function get tutor():Tutor {
			return _tutor;
		}
	}
}