package com.xmas.utils {
	import flash.display.DisplayObjectContainer;
	
	/**
	 * DisplayObjectContainerUtils<br/>
	 * 可视对象容器常用处理类<br/>
	 */
	public class DOCUtils {
		/**
		 * 清除容器内可视对象
		 * @param 目标容器
		 * @param 保留对象个数
		 * @return 目标容器
		 */
		public static function clearMc(target:DisplayObjectContainer, spare:int = 0):DisplayObjectContainer {
			while (target.numChildren > spare) {
				target.removeChildAt(0);
			}
			return target;
		}
		
		/**
		 * 将容器内可视对象变隐藏
		 * @param 目标容器
		 * @param 保留对象个数
		 * @return目标容器
		 */
		public static function allHide(target:DisplayObjectContainer, spare:int = 0):DisplayObjectContainer {
			var i:int = 0;
			while (i < target.numChildren - spare) {
				target.getChildAt(i).visible = false;
				i++;
			}
			return target;
		}
		
		/**
		 * 将旧容器内可视对象搬到新容器
		 * @param 旧容器
		 * @param 新容器
		 * @param 保留对象个数
		 * @return 新容器
		 */
		public static function take(OO:DisplayObjectContainer, ON:DisplayObjectContainer, spare:int = 0):DisplayObjectContainer {
			while (OO.numChildren > spare) {
				ON.addChild(OO.getChildAt(0));
			}
			return ON;
		}
		
		/**
		 * 将容器内可视对象进行位置更改排列
		 * @param 目标容器
		 * @param 每行几个
		 * @param 横向分布距离
		 * @param 纵向分布距离
		 * @return 目标容器
		 * @see #ListBoxChild()
		 */
		public static function ListChild(target:DisplayObjectContainer, newLineNum:int, wLong:int, hLong:int):DisplayObjectContainer {
			var i:int = 0;
			while (i < target.numChildren) {
				target.getChildAt(i).x = (i % newLineNum) * wLong;
				target.getChildAt(i).y = Math.floor(i / newLineNum) * hLong;
				i++;
			}
			return target;
		}
		
		/**
		 * 将容器内可视对象进行位置更改排列
		 * @param 目标容器
		 * @param 容器宽度
		 * @param 间距
		 * @return 目标容器
		 * @see #ListChild()
		 */
		public static function ListBoxChild(target:DisplayObjectContainer, width:int = 0, between:int = 0):DisplayObjectContainer {
			var i:int = 0;
			var useX:int = 0;
			var willX:int = 0;
			var useY:int = 0;
			var willY:int = 0;
			while (i < target.numChildren) {
				useX = willX;
				willX = useX + target.getChildAt(i).width + between;
				if (willX > width && width != 0) {
					useY = useY + willY + between;
					useX = 0;
					willX = useX + target.getChildAt(i).width + between;
					willY = target.getChildAt(i).height;
				} else {
					willY = willY > target.getChildAt(i).height ? willY : target.getChildAt(i).height;
				}
				target.getChildAt(i).x = useX;
				target.getChildAt(i).y = useY;
				i++;
			}
			return target;
		}
	}
}