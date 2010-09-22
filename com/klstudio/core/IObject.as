package com.klstudio.core {

	/**
	 * IObject 强制实现java.lang.Object对象中部分方法
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public interface IObject {
		function equals(object : *) : Boolean;

		function toString() : String;

		function getClass() : Class;

		function getClassName() : String;

		function clone() : *;
	}
}
