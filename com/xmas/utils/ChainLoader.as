package com.xmas.utils {
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ChainLoader extends EventDispatcher {
		public var isLoaing:Boolean = false;
		public var loader:Loader
		public var loadedNum:int;
		public var totalNum:int;
		private var _currentId:uint;
		private var willLoadList:Array = new Array();
		private var urlList:Array = new Array();
		public var loaderContext:LoaderContext;
		/**
		 * 链条加条;超经量级逐步加载类
		 */
		public function ChainLoader() {
			loader = new Loader();
			contentLoaderInfo.addEventListener(Event.COMPLETE, loadComHd, false, -32)
			contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errHd, false, -32);
		}
		private function errHd(e:IOErrorEvent):void {
			work();
		}
		private function loadComHd(e:Event):void {
			loadedNum++
			work();
		}
		public function push(url:String, prior:Boolean = false):uint {
			var id:uint = urlList.push(url) - 1;
			if (prior) {
				willLoadList.unshift(id);
			} else {
				willLoadList.push(id);
			}
			if (!isLoaing) {
				work()
			}
			totalNum++;
			return id
		}
		private function work():void {
			if (willLoadList.length > 0) {
				isLoaing = true;
				_currentId = willLoadList.shift();
				loader.load(new URLRequest(currentUrl), loaderContext);
			} else {
				isLoaing = false;
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		public function get contentLoaderInfo():LoaderInfo {
			return loader.contentLoaderInfo;
		}
		public function get content():DisplayObject {
			return loader.content;
		}
		public function get currentId():uint {
			return _currentId;
		}
		public function get currentUrl():String {
			return urlList[_currentId];
		}
		public function get validNum():int {
			return willLoadList.length;
		}
	}
}