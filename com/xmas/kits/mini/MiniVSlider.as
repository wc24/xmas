package com.xmas.kits.mini {
	import com.xmas.kits.Slider;
	import com.xmas.kits.vo.SliderVo;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniVSlider extends Slider {
		private var sliderVo:SliderVo;
		
		public function MiniVSlider(long:int=100) {
			sliderVo = new SliderVo();
			sliderVo.height = long;
			sliderVo.slip = new MiniButton("=")
			super(sliderVo);
		}
	}
}