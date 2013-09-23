package com.xmas.core {
	import com.xmas.utils.Wildcard;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class XmasError extends Error {
		private static var pool:Vector.<String> = initPool
		public static const length:int = pool.length;
		public static const wildcard:Wildcard = new Wildcard();
		
		public function XmasError(errorID:uint, ... arg) {
			if (errorID < length) {
				super(wildcard.replace(pool[errorID], arg), errorID);
			} else {
				throw(new XmasError(0,errorID,length))
			}
		}
		
		static private function get initPool():Vector.<String> {
			var _pool:Vector.<String> = new Vector.<String>();
			_pool.push("使用了错误的\"errorID\" errorID: {0} 超过了，已拥有的错误总数: {0} .")
			_pool.push("激活Drager类时area对象必须在舞台上")
			_pool.push("请在执行action方法后使用本方法")
			return _pool;
		}
	}
}