package com.xmas.kits {
	import com.xmas.kits.vo.ButtonVo;
	import com.xmas.kits.vo.LabelButtonVo;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class LabelButton extends Button {
		private var labelButtonVo:LabelButtonVo;
		public function LabelButton(labelButtonVo:LabelButtonVo) {
			super(labelButtonVo);
			this.labelButtonVo = labelButtonVo;
			addChild(labelButtonVo.label)
		}
		override public function get enabled():Boolean {
			return super.enabled;
		}
		override public function set enabled(value:Boolean):void {
			labelButtonVo.label.enabled = value;
			super.enabled = value;
		}
		public function get label():String {
			return labelButtonVo.label.text;
		}
		public function set label(value:String):void {
			labelButtonVo.label.text = value;
			redraw()
		}
	}
}