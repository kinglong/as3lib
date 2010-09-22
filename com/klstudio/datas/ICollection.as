package com.klstudio.datas {
	import com.klstudio.core.IObject;

	/**
	 * ICollection 与 java.util.Collection类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public interface ICollection extends IObject{
		function clear() : void;

		function add(e : *) : Boolean;

		function addAll(c : ICollection) : Boolean;

		function contains(e : *) : Boolean;

		function containsAll(c : ICollection) : Boolean;

		function get size() : uint;

		function isEmpty() : Boolean;

		function remove(e : *) : Boolean;

		function removeAll(c : ICollection) : Boolean;

		function retainAll(c : ICollection) : Boolean;

		function toArray() : Array;
	}
}
