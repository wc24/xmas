package com.xmas.kits.mini {
	import com.xmas.kits.Slider;
	import com.xmas.kits.vo.SliderVo;
	import com.xmas.utils.bound;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniVSlider extends Slider {
		private var sliderVo:SliderVo;
		
		public function MiniVSlider(long:int=100) {
			sliderVo = new SliderVo();
			sliderVo.height = long;
			sliderVo.slip = new MiniNoneButton(16,16)
			super(sliderVo);
		}
		public function get ratio():Number {
			return tutor.tutorY;
		}
		public function set ratio(vaule:Number):void {
			tutor.tutorY = bound(vaule, 0, 1);
			upSlip();
		}
	}
}