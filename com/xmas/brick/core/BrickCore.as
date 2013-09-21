package com.xmas.brick.core {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	[Event(name="draw",type="com.xmas.brick.core.BrickEvent")]
	
	public class BrickCore extends EventDispatcher {
		private var _isStart:Boolean;
		protected var _width:int;
		protected var _height:int;
		protected var _tag:int = -1;
		protected var _enabled:Boolean;
		protected var drawPartPool:Object
		protected static var exitFrameShape:Shape = new Shape();
		
		public function BrickCore(target:IEventDispatcher = null) {
			super(target);
			_enabled = true;
			drawPartPool = new Object();
		
		}
		
		protected function checkNecessity(... arg):void {
			for each (var item:Object in arg) {
				if (item == null) {
					throw(new BrickError(0, this.toString()));
				}
			}
		}
		
		/**
		 * 进入下一帧进行重绘组件
		 */
		protected function onRedraw(event:Event):void {
			//draw();
			BrickCore.exitFrameShape.removeEventListener(Event.EXIT_FRAME, onRedraw);
			dispatchEvent(new BrickEvent(BrickEvent.DRAW, this));
			drawPartPool = new Object();
		}
		
		//--------------------------------------------------public
		public function start():void {
			if (!_isStart) {
				addEventListener(BrickEvent.DRAW, onDraw);
				redraw();
			} else {
				throw(BrickError(1));
			}
			_isStart = true;
		}
		
		private function onDraw(e:BrickEvent):void {
			draw()
		}
		
		protected function draw():void {
		
		}
		
		/**
		 * 标记下一帧需要重绘组件
		 */
		public function redraw(part:String = "all"):void {
			drawPartPool[part] = true;
			BrickCore.exitFrameShape.addEventListener(Event.EXIT_FRAME, onRedraw);
		}
		
		/**
		 * 按部件绘图
		 */
		public function deletePart(... arg:Array):Boolean {
			var bool:Boolean = drawPartPool[DrawPart.ALL];
			for each (var item:String in arg) {
				bool = bool || drawPartPool[item]
				delete drawPartPool[item];
			}
			return bool
		}
		
		public function checkPart(... arg:Array):Boolean {
			var bool:Boolean = drawPartPool[DrawPart.ALL];
			for each (var item:String in arg) {
				if (bool) {
					return bool
				} else {
					bool = drawPartPool[item]
				}
			}
			return bool
		}
		
		/**
		 * 设置组件尺寸大小.
		 * @param	width
		 * @param	height
		 */
		public function setSize(width:int, height:int):void {
			_width = width;
			_height = height;
			redraw(DrawPart.SIZE);
		}
		
		public function referSize(displayObject:DisplayObject, width:int = 0, height:int = 0):void {
			_width = (displayObject.width >> 0) + width;
			_height = (displayObject.height >> 0) + height;
		}
		
		/**
		 * 本组件系统希望能在不缩放的舞台的上显示.
		 */
		public static function initStage(stage:Stage):void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
		//--------------------------------------------------getter/setters
		/**
		 * 设置/获取 组件宽度
		 */
		public function set width(width:int):void {
			_width = width >> 0;
			redraw(DrawPart.SIZE);
		}
		
		public function get width():int {
			return _width;
		}
		
		/**
		 *设置/获取 组件高度
		 */
		public function set height(height:int):void {
			_height = height >> 0;
			redraw(DrawPart.SIZE);
		}
		
		public function get height():int {
			return _height;
		}
		
		/**
		 * 设置/获取 组件标识号
		 */
		public function set tag(value:int):void {
			_tag = value;
		}
		
		public function get tag():int {
			return _tag;
		}
		
		/**
		 * 设置/获取 组件是否可用;
		 */
		public function set enabled(value:Boolean):void {
			_enabled = value;
			redraw(DrawPart.STATE);
		}
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		public function get isStart():Boolean {
			return _isStart;
		}
	
	}

}