package com.xmas.brick.mini {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class AllMini extends Sprite {
		private var miniButton:MiniButton;
		private var enabledButton:MiniButton;
		private var miniLabel:MiniLabel;
		
		private var colorButton:MiniButton;
		private var miniTextbox:MiniTextbox;
		
		private var miniTextButton:MiniTextButton;
		
		private var miniBox:MiniBox;
		private var miniPrompt:MiniPrompt;
		
		public function AllMini() {
			//---------------------------
			miniLabel = new MiniLabel("miniLabel");
			miniLabel.move(2, 2);
			addChild(miniLabel);
			//---------------------------
			miniTextbox = new MiniTextbox("MiniTextbox__MiniTextbox", 50);
			miniTextbox.move(100, 2);
			addChild(miniTextbox);
			//---------------------------
			miniTextButton = new MiniTextButton("MiniTextButton");
			miniTextButton.move(200, 40);
			addChild(miniTextButton);
			//---------------------------
			
			enabledButton = new MiniButton("ENABLED:false");
			enabledButton.addEventListener(MouseEvent.CLICK, enabledButton_click);
			enabledButton.move(300, 300);
			addChild(enabledButton);
			
			//-------------------
			colorButton = new MiniButton("change color");
			colorButton.addEventListener(MouseEvent.CLICK, click);
			colorButton.move(400, 300);
			addChild(colorButton);
			//-------------------------------
			
			miniBox = new MiniBox(200, 100)
			miniBox.move(400, 200);
			addChild(miniBox);
			
			miniButton = new MiniButton("MiniButton\nMiniButton");
			miniButton.width = 10; //无效操作
			miniButton.move(-10, -10);
			miniBox.addChild(miniButton);
			
			miniPrompt = new MiniPrompt(200)
			miniPrompt.title="MiniPrompt"
			miniPrompt.text="MiniPromptMiniProiniPromptMiiniPromptMiniPromptMiniPromptMiniPrompt"
			miniPrompt.move(400, 2);
			addChild(miniPrompt);
			miniPrompt.submitButton.addEventListener(MouseEvent.CLICK, submitButton_click);
		
		}
		
		private function submitButton_click(e:MouseEvent):void 
		{
			miniPrompt.text+="tMiniPromptMiniPromptMiniPromptMiniPromptMiniPromptM"
		}
		
		private function click(e:MouseEvent):void {
			miniLabel.color = Math.random() * 0xFFFFFF
			//miniButton.labelCore.color=Math.random()*0xFFFFFF
			miniTextbox.color = Math.random() * 0xFFFFFF
			miniTextButton.color = Math.random() * 0xFFFFFF
		}
		
		private function enabledButton_click(e:MouseEvent):void {
			miniButton.enabled = !miniButton.enabled;
			miniLabel.enabled = !miniLabel.enabled;
			colorButton.enabled = !colorButton.enabled
			enabledButton.label = "ENABLED:" + !miniLabel.enabled;
		}
	
	}

}