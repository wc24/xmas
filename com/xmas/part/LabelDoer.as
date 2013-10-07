package com.xmas.part {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	public class LabelDoer extends PartDoer {
		private var textField:TextField;
		public function LabelDoer(textField:TextField = null) {
			start(textField)
		}
		public function start(textField:TextField):void {
			if (textField) {
				this.textField = textField;
				activate()
			}
		}
		override public function activate():void {
			LabelDoer.tool(textField);
		}
		override public function destroy():void {
			super.destroy();
			textField = null;
		}
		static public function tool(textField:TextField):void {
			textField.selectable = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
		}
	}
}