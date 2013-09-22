package com.xmas.kits.mini {
	import com.xmas.kits.Slider;
	import com.xmas.kits.vo.SliderVo;
	import com.xmas.utils.bound;
	import com.xmas.utils.Tutor;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniHSlider extends Slider {
		private var sliderVo:SliderVo;
		public function MiniHSlider(long:int = 100) {
			sliderVo = new SliderVo();
			sliderVo.width = long;
			sliderVo.slip = new MiniNoneButton(14, 14)
			super(sliderVo);
		}
		public function get ratio():Number {
			return tutor.tutorX;
		}
		public function set ratio(vaule:Number):void {
			tutor.tutorX = bound(vaule, 0, 1);
			upSlip();
		}
	}
}