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
	public class NetBitmap extends Bitmap implements ICanDestroy {
		static public var dataPool:Object = new Object();
		static public var cacheIdPool:Object = new Object();
		static public var loader:ChainLoader = new ChainLoader();
		private var _url:String;
		private var _cache:Boolean;
		private var _id:uint;
		public function NetBitmap(cache:Boolean = true, pixelSnapping:String = "auto", smoothing:Boolean = false) {
			super(null, pixelSnapping, smoothing);
			_cache = cache;
		}
		public function load(url:String, prior:Boolean = false):void {
			if (url != null && url != "") {
				_url = url;
				if (dataPool[_url] != null) {
					bitmapData = dataPool[_url] as BitmapData
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
				bitmapData.dispose()
			}
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
			}
		}
		private function progressHd(e:ProgressEvent):void {
			if (id == loader.currentId) {
				dispatchEvent(ProgressEvent(e));
			}
		}
		private function loadComHd(e:Event):void {
			if (id == loader.currentId) {
				removeEvent()
				var contentBitmap:Bitmap = loader.content as Bitmap
				if (contentBitmap == null) {
					throw(new XmasError(3));
				} else {
					if (cache) {
						dataPool[_url] = contentBitmap.bitmapData;
					}
					bitmapData = dataPool[_url] as BitmapData
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