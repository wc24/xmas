package com.xmas.kits.mini {
	import com.xmas.kits.Slider;
	import com.xmas.kits.vo.SliderVo;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniSlider extends Slider {
		private var sliderVo:SliderVo;
		
		public function MiniSlider() {
			sliderVo = new SliderVo();
			sliderVo.width = 100;
			sliderVo.height = 100;
			sliderVo.slip = new MiniButton("|||")
			super(sliderVo);
		}
	}
}