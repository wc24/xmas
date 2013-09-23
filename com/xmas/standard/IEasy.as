package com.xmas.standard {
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * 本接口定义用于需要进步内存释放且需要随时可以停止开始工作的类，实现了激活，无效，破坏的方法
	 */
	public interface IEasy extends ICanDestroy {
		/**
		 * 停止工作。
		 */
		function deactivate():void
		/**
		 * 开始工作。部分功能需要依靠舞台才能进步工作。
		 * @param rely:所要依靠的舞台
		 * @see easy.wc.way.AutoStageActivate AutoStageActivate
		 * @see easy.wc#stageActivate() stageActivate
		 */
		function activate():void
	}
}