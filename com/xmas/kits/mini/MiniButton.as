package com.xmas.kits.mini {
	import com.xmas.kits.Button;
	import com.xmas.kits.Kit;
	import com.xmas.kits.vo.ButtonVo;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniButton extends Button {
		private var _buttonVo:ButtonVo;
		
		public function MiniButton(label:String = "") {
			_buttonVo = new ButtonVo();
			_buttonVo.overSkin = new Sprite();
			_buttonVo.normalSkin = new Sprite();
			_buttonVo.disableSkin = new Sprite();
			_buttonVo.label = new MiniLabel(label)
			_buttonVo.label.move(3, 0)
			super(_buttonVo)
		}
		
		override public function draw():void {
			referSize(_buttonVo.label, 4, 0);
			MiniStyle.drawSkin(_buttonVo.overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(_buttonVo.normalSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor, _width, _height);
			MiniStyle.drawSkin(_buttonVo.disableSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor, _width, _height);
			super.draw();
		}
	}
}