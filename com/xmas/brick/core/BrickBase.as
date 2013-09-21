package com.xmas.brick.core {
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class BrickBase extends Sprite {
		public var core:BrickCore;
		
		public function BrickBase(core:BrickCore) {
			this.core = core;
		}
		
		/**
		 * 移动组件到指定位置.
		 * @param	x
		 * @param	y
		 */
		public function move(x:Number, y:Number):void {
			this.x = x >> 0;
			this.y = y >> 0;
		}
		
		public function get enabled():Boolean {
			return core.enabled;
		}
		
		public function set enabled(value:Boolean):void {
			mouseEnabled = value;
			tabEnabled = value;
			core.enabled = value;
		}
		
		override public function get width():Number {
			return core.width;
		}
		
		override public function set width(value:Number):void {
			core.width = value;
		}
		
		override public function get height():Number {
			return core.height;
		}
		
		override public function set height(value:Number):void {
			core.height = value;
		}
		
		override public function get x():Number {
			return super.x;
		}
		
		override public function set x(value:Number):void {
			super.x = value>> 0;
		}
		
		override public function get y():Number {
			return super.y;
		}
		
		override public function set y(value:Number):void {
			super.y = value>> 0;
		}
	}

}