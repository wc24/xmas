package com.xmas.kits.mini {
	import com.xmas.kits.Button;
	import com.xmas.kits.vo.ButtonVo;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniNoneButton extends Button {
		private var _buttonVo:ButtonVo;
		public function MiniNoneButton(width:int = 5, height:int = 5) {
			_buttonVo = new ButtonVo();
			_buttonVo.overSkin = new Sprite();
			_buttonVo.normalSkin = new Sprite();
			_buttonVo.disableSkin = new Sprite();
			super(_buttonVo)
			this.width = width;
			this.height = height;
		}
		override public function draw():void {
			MiniStyle.drawSkin(_buttonVo.overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(_buttonVo.normalSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(_buttonVo.disableSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor, _width, _height);
			super.draw();
		}
	}
}