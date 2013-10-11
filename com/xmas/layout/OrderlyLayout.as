package com.xmas.layout {
	import com.xmas.doer.RectangleDoer;
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	import com.xmas.standard.ILayoutDoer;
	import com.xmas.standard.IRectangle;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class OrderlyLayout implements ILayoutDoer {
		private var pool:Dictionary;
		public var ratioH:Number = 0
		public var ratioV:Number = 0
		private var _spaceH:int;
		private var _spaceV:int;
		private var _boundRect:Rectangle;
		private var careContainer:Boolean;
		private var list:Vector.<IRectangle>;
		
		public function OrderlyLayout(boundRect:Rectangle, spaceH:int = 100, spaceV:int = 100, careContainer:Boolean = true) {
			this.careContainer = careContainer;
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
		
		public function add(target:IRectangle):int {
			pool[target] = list.push(target)-1;
			return pool[target];
		}
		
		public function addDisplay(target:DisplayObject):IRectangle {
			if (target != null && pool[target] == null) {
				//add(new RectangleDoer(target))
				var rectangle:IRectangle = new RectangleDoer(target);
				pool[target] = list.push(rectangle)-1;
			}
			return rectangle;
		}
		
		public function addContainer(target:DisplayObjectContainer, order:Boolean = true):void {
			var len:int = target.numChildren
			for (var i:int = 0; i < len; i++) {
				addDisplay(target.getChildAt(order ? i : len - i));
			}
		}
		
		public function update():void {
			var lenX:int = Math.floor(_boundRect.width / spaceH);
			var lenY:int = Math.ceil(length / lenX);
			var containerOffsetX:int = careContainer ? _boundRect.width * ratioH - lenX * spaceH * ratioH : 0;
			var containerOffsetY:int = careContainer ? _boundRect.width * ratioV - lenY * spaceV * ratioV : 0;
			for (var i:int = 0; i < list.length; i++) {
				list[i].x = _boundRect.x + i % lenX * spaceH - (list[i].width - spaceH) * ratioH + containerOffsetX
				list[i].y = _boundRect.y + Math.floor(i / lenX) * spaceV - (list[i].height - spaceH) * ratioV + containerOffsetY;
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
	}
}