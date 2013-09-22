package com.xmas.kits.mini {
	import com.xmas.kits.Button;
	import com.xmas.kits.vo.WindowVo;
	import com.xmas.kits.Window;
	import flash.display.Shape;
	
	public class MiniWindow extends Window {
		private var _windowVo:WindowVo;
		
		public function MiniWindow(width:int = 200, height:int = 100) {
			_windowVo = new WindowVo();
			_windowVo.width = width
			_windowVo.height = height
			_windowVo.content = new MiniBox(_windowVo.width, _windowVo.height - 20);
			_windowVo.content.move(0, 20);
			_windowVo.content.backgroundColor = MiniStyle.windowBackground;
			_windowVo.content.backgroundAlpha = 1;
			_windowVo.titleBox = new MiniBox(_windowVo.width, 20);
			_windowVo.titleBox.backgroundColor = MiniStyle.panelBackground
			_windowVo.titleBox.backgroundAlpha = 1;
			_windowVo.closeButton = new MiniButton("X")
			_windowVo.closeButton.y = 1;
			_windowVo.title = new MiniLabel();
			super(_windowVo)
		}
		
		override public function draw():void {
			_windowVo.closeButton.x = width - _windowVo.closeButton.width - 1;
			_windowVo.title.x = width / 2 - _windowVo.title.width / 2;
			super.draw();
		}
		
		public function get title():String {
			return _windowVo.title.text;
		}
		
		public function set title(value:String):void {
			_windowVo.title.text = value;
		}
		
		public function get windowVo():WindowVo {
			return _windowVo;
		}
		
		public function get closeButton():Button {
			return _windowVo.closeButton;
		}
	}
}