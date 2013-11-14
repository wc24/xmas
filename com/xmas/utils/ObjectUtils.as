package com.xmas.utils {
	/**
	 * 对象属性变化
	 * */
	public class ObjectUtils {
		/**
		 * 构造函数
		 */
		public function ObjectUtils() {
		}
		/**
		 * 返回目标对象属性长度
		 * @param object 目标对象
		 * @example
		 * 获取对象的属性长度
		 * <listing version="3.0">
		   package
		   {
		   import easy.core.utils.ObjectUtils;
		   import flash.display.Sprite;
		   import vo.ImagePrestrainVo;
		
		   public class Main extends Sprite
		   {
		   public function Main():void
		   {
		   var obj:Object = {a: "foo", b: "bar", c: "ee"};
		   trace(ObjectUtils.objectLength(obj));
		   }
		   }
		   }</listing>
		 * @param object 传入作为参数的对象
		 * @return 返回对象的属性长度
		 */
		public static function objectLength(object:Object):Number {
			var num:Number = 0;
			for (var i:String in object) {
				num++;
			}
			return num;
		}
		/**
		 * 合并重新取值,根据新值对象属性,更新目标对象属性或添加新属性
		 * @param object 目标对象
		 * @example
		 * <listing version="3.0">
		   package
		   {
		   import easy.core.utils.ObjectUtils;
		   import flash.display.Sprite;
		
		   public class Main extends Sprite
		   {
		   public function Main():void
		   {
		   var obj:Object = {a1: "foo", a2: "foof", a3: "foqo"};
		   var obj1:Object = {a4: "foo", a5: "fdoo", a6: "foo1"};
		   ObjectUtils.merge(obj, obj1);
		   var i:int = ObjectUtils.objectLength(obj);
		   for (var k:int = 0; k &lt; i; k++)
		   {
		   trace(obj["a" + (k + 1)]);
		   }
		   }
		   }
		   }</listing>
		 * @param  target 目标对象
		 * @param  value  新增对象
		 */
		public static function merge(target:Object, value:Object):void {
			for (var i:String in value) {
				try {
					target[i] = value[i];
				} catch (event:*) {
					trace(event + "<<合并出错,对象无法添加或更改新履属性");
				}
			}
		}
		/**
		 * 更新 更新目标对象内属性，根据目标对象属性查找新值
		 * @example
		 * <listing version="3.0">
		   package
		   {
		   import easy.core.utils.ObjectUtils;
		   import flash.display.Sprite;
		
		   public class Main extends Sprite
		   {
		   public function Main():void
		   {
		   var obj:Object = {a1: "foo", a2: "foof", a3: "foqo"}
		   var obj1:Object = {a1: "foo", a2: "foodf", a3: "foo1"}
		   var tempobj:Object = ObjectUtils.update(obj, obj1);
		   trace(tempobj.a1);
		   trace(tempobj.a2);
		   trace(tempobj.a3);
		   }
		   }
		   }</listing>
		 * @param target  目标对象
		 * @param value  新值对象
		 * @return  更新完的目标对象target
		 */
		public static function update(target:Object, value:Object):Object {
			if (value != null) {
				for (var i:String in target) {
					try {
						target[i] = value[i] == null ? target[i] : value[i];
					} catch (eve:*) {
						trace(eve + "<<更新出错");
					}
				}
			}
			return target;
		}
		/**
		 * 位置、大小模仿
		 * @example
		 * <listing version="3.0">
		   package
		   {
		   import easy.core.utils.ObjectUtils;
		   import flash.display.Sprite;
		
		   public class Main extends Sprite
		   {
		   public function Main():void
		   {
		   var obj:Object = {a1: "foo", a2: "foof", a3: "foqo"}
		   var obj1:Object = {a1: "foo", a2: "foodf", a3: "foo1"}
		   obj1.x = 100;
		   obj1.y = 100;
		   obj1.width = 100;
		   obj1.height = 100;
		   var tempobj:Object = ObjectUtils.mock(obj, obj1);
		   trace(tempobj.x, tempobj.y, tempobj.width, tempobj.height);
		   }
		   }
		   }</listing>
		 * @param target  目标对象
		 * @param value  新值对象
		 * @return  返回更新后的目标对象
		 */
		public static function mock(target:Object, value:Object):Object {
			if (value != null) {
				target.x = value.x != null ? value.x : 0;
				target.y = value.y != null ? value.y : 0;
				if (value.width != null) {
					target.width = value.width;
				}
				if (value.height != null) {
					target.height = value.height;
				}
			}
			return target;
		}
		/**
		 * 列出对象
		 * @example
		 * <listing version="3.0">
		   package
		   {
		   import easy.core.utils.ObjectUtils;
		   import flash.display.Sprite;
		
		   public class Main extends Sprite
		   {
		   public function Main():void
		   {
		   var obj:Object = {a1: "foo", a2: "foof", a3: "foqo"};
		   trace(ObjectUtils.seeObj(obj));
		   }
		   }
		   }</listing>
		 * @param object  目标对象
		 * @return  返回目标的属性及值的字符串
		 */
		public static function seeObj(object:Object):String {
			var outvar:Array = new Array();
			for (var i:String in object) {
				outvar.push(String(i + ":" + object[i]));
			}
			return "{" + outvar.join(",") + "}";
		}
		/**
		 * 目标对象替换字符串
		 * @param object  目标对象
		 * @return
		 */
		public static function delEnter(object:Object):String {
			return object.toString().replace(/\r\n/ig, "\r");
		}
		static public function toStringFormat(object:Object, ... arg):String {
			var string:String = "[" + noClass(object["constructor"])
			for each (var item:String in arg) {
				string += " "
				string += item
				string += "="
				string += object[item] == null ? "null" : object[item]
			}
			string += "]"
			return string
		}
		static private function noClass(string:String):String {
			return string.slice(7, string.length - 1);
		}
		public static function get BAWMatrix():Array {
			return new Array(1 / 3, 1 / 3, 1 / 3, 0, 0, 1 / 3, 1 / 3, 1 / 3, 0, 0, 1 / 3, 1 / 3, 1 / 3, 0, 0, 0, 0, 0, 1, 0);
		}
	}
}