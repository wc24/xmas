package com.xmas.brick.core {
	import com.xmas.utils.Wildcard;
	import com.xmas.utils.XmasError;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class BrickError extends Error {
		private static var pool:Vector.<String> = initPool
		public static const length:int = pool.length;
		public static const wildcard:Wildcard = new Wildcard();
		
		public function BrickError(errorID:uint, ... arg) {
			if (errorID < length) {
				super(wildcard.replace(pool[errorID], arg), errorID);
			} else {
				throw(new XmasError(0,errorID,length))
			}
		}
		
		static private function get initPool():Vector.<String> {
			var _pool:Vector.<String> = new Vector.<String>();
			_pool.push("你在使用组件{0}时，必要的属性没有被创建,请在调用start方法前调用.")
			_pool.push("不能重复启动组件.")
			return _pool;
		}
	}
}