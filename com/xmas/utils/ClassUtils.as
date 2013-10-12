
package com.xmas.utils {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * 类加载工具
	 */
	public class ClassUtils {
		/**
		 * 获取实例
		 * @param	name 实例名
		 * @return  新的实例
		 */
		public static function getInstance(name:String):* {
			return new (getDefinitionByName(name));
		}
		/**
		 * 获取类
		 * @param	object  对象
		 * @return  对象类
		 */
		public static function getClass(object:Object):* {
			return Class(getDefinitionByName(getQualifiedClassName(object)));
		}
		/**
		 * 获取类名
		 * @param	obj  对象
		 * @return  类名
		 */
		public static function getClassName(obj:Object):String {
			var stuff:Array = getQualifiedClassName(obj).split(/::/);
			return stuff[stuff.length - 1];
		}
		/**
		 * 获取一般类
		 * @param	vector  对象
		 * @return  对象类
		 */
		public static function getGenericClass(vector:Object):Class {
			var className:String = getQualifiedClassName(vector);
			return Class(getDefinitionByName(className.slice(className.indexOf("<") + 1, className.indexOf(">"))));
		}
	}
}