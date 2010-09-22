package com.klstudio.core {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * CoreObject 重定义Object
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class CoreObject extends Object implements IObject {
		public function CoreObject() {
			super();
		}

		public function equals(object : *) : Boolean {
			// TODO: Auto-generated method stub
			return this == object;
		}

		public function toString() : String {
			// TODO: Auto-generated method stub
			return "[" + getClassName() + "]";
		}

		public final function getClassName() : String {
			return getQualifiedClassName(this).replace("::",".");
		}

		public final function getClass() : Class {
			// TODO: Auto-generated method stub			
			return getDefinitionByName(getClassName()) as Class;
		}

		public function clone() : * {
			throw new Error("CloneNotSupported " + getClassName());
		}
	}
}
