package com.xmas.brick.mini {
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.BrickEvent;
	import com.xmas.brick.core.ButtonCore;
	import com.xmas.brick.core.DrawPart;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniButton extends BrickBase {
		private var normalSkin:Sprite;
		private var overSkin:Sprite;
		private var enabledSkin:Sprite;
		private var miniLabel:MiniLabel;
		private var buttonCore:ButtonCore;
		
		public function MiniButton(label:String = "") {
			normalSkin = new Sprite()
			overSkin = new Sprite()
			enabledSkin = new Sprite()
			miniLabel = new MiniLabel(label);
			buttonCore = new ButtonCore()
			buttonCore.normalSkin = normalSkin;
			buttonCore.overSkin = overSkin;
			buttonCore.enabledSkin = enabledSkin;
			buttonCore.interactive = this;
			buttonCore.addEventListener(BrickEvent.DRAW, core_draw);
			miniLabel.move(2, 0);
			buttonCore.start();
			addChild(enabledSkin)
			addChild(overSkin)
			addChild(normalSkin)
			addChild(miniLabel)
			super(buttonCore)
		}
		
		private function core_draw(e:BrickEvent):void {
			buttonCore.referSize(miniLabel, 4, 0);
			drawSkin(overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor);
			drawSkin(normalSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor);
			drawSkin(enabledSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor);
		}
		
		protected function drawSkin(graphics:Graphics, fill:uint, line:uint):void {
			graphics.clear()
			graphics.lineStyle(1, line);
			graphics.beginFill(fill, 1);
			graphics.drawRect(0, 0, buttonCore.width, buttonCore.height);
			graphics.endFill();
		}
		
		public function get label():String {
			return miniLabel.label;
		}
		
		public function set label(value:String):void {
			miniLabel.label = value;
			core.redraw(DrawPart.VALUE);
		}
	}
}