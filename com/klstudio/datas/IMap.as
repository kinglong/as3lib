package com.klstudio.datas {
	import com.klstudio.core.IObject;

	/**
	 * IMap 与 java.util.Map类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public interface IMap extends IObject {
		function clear() : void;

		function containsKey(key : *) : Boolean;

		function containsValue(value : *) : Boolean;

		function get(key : *) : *;

		function put(key : *,value : *) : *;

		function remove(key : *) : *;

		function putAll(map : IMap) : void;

		function get size() : uint;

		function isEmpty() : Boolean;

		function get keys() : Array;

		function get values() : Array;
	}
}
