package com.xmas.standard {
	
	/**
	 * 本接口定义用于需要进步内存释放的类，实现了破坏自身的方法。
	 */
	public interface ICanDestroy {
		/**
		 * 破坏自身无法重复使用！
		 */
		function destroy():void
	}
}