package com.xmas.kits.mini {
	import com.xmas.kits.Slider;
	import com.xmas.kits.vo.SliderVo;
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
			sliderVo.slip = new MiniButton("|||")
			super(sliderVo);
		}
		
		public function get ratio():Number {
			return tutor.tutorX;
		}
		//trace(_tutor.tutorX)
	}
}