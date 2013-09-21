package com.xmas.brick.mini {
	import com.xmas.brick.core.BoxCore;
	import com.xmas.brick.core.BrickBase;
	import com.xmas.brick.core.BrickEvent;
	import com.xmas.brick.core.DrawPart;
	import com.xmas.utils.bound;
	import com.xmas.utils.Drager;
	import com.xmas.utils.IDragObject;
	import flash.display.Shape;
	import flash.events.Event;
	
	public class MiniPrompt extends BrickBase implements IDragObject {
		private var boxCore:BoxCore;
		private var miniTextbox:MiniTextbox;
		public var closeButton:MiniButton;
		public var submitButton:MiniButton;
		private var titleBox:MiniBox;
		private var mask:Shape;
		private var titleLabel:MiniLabel;
		private var drager:Drager;
		
		public function MiniPrompt(width:int) {
			miniTextbox = new MiniTextbox("", width - 10);
			closeButton = new MiniButton("X")
			submitButton = new MiniButton("SUBMIT")
			titleLabel = new MiniLabel();
			titleBox = new MiniBox();
			mask = new Shape();
			boxCore = new BoxCore();
			drager = new Drager()
			drager.boundStage = true;
			drager.action(this, titleBox);
			drager.useHandCursor = true;
			closeButton.y = 1;
			titleBox.backgroundAlpha = 1;
			titleBox.backgroundColor = MiniStyle.panelBackground;
			titleBox.height = 20;
			
			boxCore.backgroundAlpha = 1;
			boxCore.backgroundColor = MiniStyle.windowBackground;
			boxCore.content = this;
			boxCore.mask = mask;
			miniTextbox.move(5, 25)
			addChild(titleBox)
			addChild(closeButton)
			addChild(miniTextbox)
			addChild(submitButton)
			titleBox.addChild(titleLabel)
			boxCore.addEventListener(BrickEvent.DRAW, boxCore_draw);
			boxCore.start();
			super(boxCore)
			
			this.width = width;
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.addEventListener(Event.RESIZE, resize);
		}
		
		private function resize(e:Event):void {
			x = bound(x, 0, stage.stageWidth - width);
			y = bound(y, 0, stage.stageHeight - height);
		}
		
		private function removedFromStage(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.removeEventListener(Event.RESIZE, resize);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function get text():String {
			return miniTextbox.text;
		}
		
		public function set text(value:String):void {
			miniTextbox.text = value;
			boxCore.redraw(DrawPart.SIZE)
		}
		
		private function boxCore_draw(e:BrickEvent):void {
			if (boxCore.checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				boxCore.height = miniTextbox.height + 50;
				submitButton.y = boxCore.height - 20;
				submitButton.x = boxCore.width / 2 - submitButton.width / 2;
				closeButton.x = boxCore.width - closeButton.width - 2;
				titleLabel.x = boxCore.width / 2 - titleLabel.width / 2;
				mask.graphics.clear();
				mask.graphics.beginFill(0, 0);
				mask.graphics.drawRect(0, 0, boxCore.width, boxCore.height);
				mask.graphics.endFill();
			}
		}
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			super.width = value;
			titleBox.width = value;
		}
		
		public function get title():String {
			return titleLabel.label;
		}
		
		public function set title(value:String):void {
			titleLabel.label = value;
		}
	
	}

}