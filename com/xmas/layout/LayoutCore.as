package com.xmas.layout {
	import com.xmas.doer.RectangleDoer;
	import com.xmas.standard.ILayoutDoer;
	import com.xmas.standard.IRectangle;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class LayoutCore implements ILayoutDoer {
		private var _spaceH:int;
		private var _spaceV:int;
		private var _boundRect:Rectangle;
		protected var pool:Dictionary;
		protected var list:Vector.<IRectangle>;
		
		public function LayoutCore(boundRect:Rectangle, spaceH:int = 100, spaceV:int = 100) {
			_boundRect = boundRect;
			_spaceV = spaceV;
			_spaceH = spaceH;
			pool = new Dictionary(true)
			list = new Vector.<IRectangle>();
		}
		
		/* INTERFACE com.xmas.standard.ILayoutDoer */
		public function get boundRect():Rectangle {
			return _boundRect;
		}
		
		public function set boundRect(value:Rectangle):void {
			_boundRect = value;
		}
		
		public function get spaceH():int {
			return _spaceH;
		}
		
		public function set spaceH(value:int):void {
			_spaceH = value;
		}
		
		public function get spaceV():int {
			return _spaceV;
		}
		
		public function set spaceV(value:int):void {
			_spaceV = value;
		}
		
		public function get length():uint {
			return list.length;
		}
		
		public function add(target:IRectangle):void {
			pool[target] = list.push(target) - 1;
		}
		
		public function addDisplay(target:DisplayObject):IRectangle {
			if (target != null && pool[target] == null) {
				var rectangle:IRectangle = new RectangleDoer(target);
				pool[target] = list.push(rectangle) - 1;
			}
			return rectangle;
		}
		
		public function addContainer(target:DisplayObjectContainer, order:Boolean = true):void {
			var len:int = target.numChildren
			for (var i:int = 0; i < len; i++) {
				addDisplay(target.getChildAt(order ? i : len - i));
			}
		}
		
		public function clear():void {
			pool = new Dictionary(true)
			list = new Vector.<IRectangle>();
		}
		
		public function remove(target:Object):IRectangle {
			var rectangle:IRectangle
			if (target != null && pool[target] != null) {
				rectangle = list[pool[target]];
				list.splice(pool[target], 1);
				delete pool[target];
				return rectangle;
			}
			return null
		}
		
		/* INTERFACE com.xmas.standard.ILayoutDoer */
		public function update():void {
		}
	}
}