package com.xmas.display {
	import com.xmas.core.XmasError;
	import com.xmas.standard.ICanDestroy;
	import com.xmas.utils.ChainLoader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	[Event(name="complete",type="flash.events.Event")]
	[Event(name="progress",type="flash.events.ProgressEvent")]
	[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public class NetBitmap extends Bitmap implements ICanDestroy {
		static public var dataPool:Object = new Object();
		static public var cacheIdPool:Object = new Object();
		static public var loader:ChainLoader = initLoader()
		private var _url:String;
		private var _cache:Boolean;
		private var _id:uint;
		private var _smoothing:Boolean;
		public function NetBitmap(cache:Boolean = true, pixelSnapping:String = "auto", smoothing:Boolean = false) {
			super(null, pixelSnapping, smoothing);
			_cache = cache;
		}
		static public function prestrain(url:String):Boolean {
			if (url != null && url != "" && dataPool[url] == null && cacheIdPool[url] == null) {
				var id:int = loader.push(url, true);
				cacheIdPool[url] = id;
				return true
			}
			return false
		}
		static private function initLoader():ChainLoader {
			var loader:ChainLoader = new ChainLoader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_complete);
			return loader
		}
		static private function loader_complete(e:Event):void {
			if (cacheIdPool[loader.currentUrl] != null) {
				var contentBitmap:Bitmap = loader.content as Bitmap
				if (contentBitmap == null) {
					throw(new XmasError(3));
				} else {
					dataPool[loader.currentUrl] = contentBitmap.bitmapData;
				}
			}
		}
		public function load(url:String, prior:Boolean = false):void {
			if (url != null && url != "") {
				_url = url;
				if (dataPool[_url] != null) {
					bitmapData = dataPool[_url] as BitmapData
					super.smoothing=_smoothing
					dispatchEvent(new Event(Event.COMPLETE));
				} else {
					if (cacheIdPool[_url] == null) {
						_id = loader.push(_url, prior);
						if (_cache) {
							cacheIdPool[_url] = id;
						}
					} else {
						_id = cacheIdPool[_url];
						_cache = true;
					}
					addEvent()
				}
			} else if (bitmapData) {
				bitmapData = null
			}
		}
		override public function get smoothing():Boolean 
		{
			return _smoothing;
		}
		
		override public function set smoothing(value:Boolean):void 
		{
			_smoothing = value;
		}
		public function destroy():void {
			bitmapData.dispose()
			bitmapData = null;
			removeEvent()
		}
		private function removeEvent():void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComHd)
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loader_ioError);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progressHd)
		}
		private function addEvent():void {
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComHd)
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loader_ioError);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHd)
		}
		private function loader_ioError(e:IOErrorEvent):void {
			if (id == loader.currentId) {
				removeEvent()
				dispatchEvent(IOErrorEvent(e));
					//dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
			}
		}
		private function progressHd(e:ProgressEvent):void {
			if (id == loader.currentId) {
				dispatchEvent(ProgressEvent(e));
					//dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
			}
		}
		private function loadComHd(e:Event):void {
			if (id == loader.currentId) {
				removeEvent()
				var contentBitmap:Bitmap = loader.content as Bitmap
				if (contentBitmap == null) {
					throw(new XmasError(3));
				} else {
					bitmapData = contentBitmap.bitmapData
					super.smoothing=_smoothing
				}
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		public function get cache():Boolean {
			return _cache;
		}
		public function get id():uint {
			return _id;
		}
		public function get url():String {
			return _url;
		}
	}
}