package com.xmas.core {
	import flash.utils.Dictionary;
	import flash.utils.flash_proxy;
	import flash.utils.Proxy;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class Pool extends Proxy {
		private var pre:Dictionary;
		private var pos:Dictionary;
		private var _length:uint;
		private var current:Object;
		public var first:Object;
		public var last:Object;
		public function Pool() {
			pre = new Dictionary();
			pre = new Dictionary();
		}
		public function push(... arg):uint {
			for each (var item:Object in arg) {
				add(item)
			}
			return length
		}
		public function add(item:Object):void {
			if (item != null) {
				pre[item] = last
				if (last != null) {
					pos[last] = item
				} else {
					first = item
				}
				last = item;
				_length++;
			}
		}
		public function jump(item:Object, sitItem:Object):Boolean {
			if (item != null && sitItem != null) {
				if (pre[sitItem]) {
					pre[item] = pre[sitItem]
					pos[item] = sitItem;
					pos[pre[sitItem]] = item;
					pre[sitItem] = item;
				} else {
					pos[item] = first;
					pre[first] = item;
					first = item
				}
				_length++;
				return true
			}
			return false
		}
		public function remove(item:Object):Boolean {
			if (item != null) {
				if (pre[item]) {
					if (pos[item]) {
						pos[pre[item]] = pos[item];
						pre[pos[item]] = pre[item];
						delete pre[item];
						delete pos[item];
					} else {
						last = pre[item];
						delete pos[pre[item]];
						delete pre[item];
					}
				} else {
					if (pos[item]) {
						first = pos[item];
						delete pre[pos[item]];
						delete pos[item];
					} else if (first == item) {
						last = null;
						last = null;
					} else {
						return false
					}
				}
				_length--
				return true
			}
			return false
		}
		public function get length():uint {
			return _length;
		}
		override flash_proxy function nextNameIndex(index:int):int {
			return index >= _length ? 0 : index + 1;
		}
		override flash_proxy function nextName(index:int):String {
			return null
		}
		override flash_proxy function nextValue(index:int):* {
			if (index == 1) {
				current = first
			} else {
				current = pos[current];
			}
			return current
		}
	}
}