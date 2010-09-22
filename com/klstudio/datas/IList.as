package com.klstudio.datas {

	/**
	 * IList 与 java.util.List类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public interface IList extends ICollection {
		function addAt(index : uint,e : *) : void;

		function addAllAt(index : uint,c : ICollection) : void;

		function get(index : uint) : *;

		function set(index : uint,e : *) : *;

		function indexOf(e : *) : int;

		function lastIndexOf(e : *) : int;

		function removeAt(index : uint) : *

		function subList(fromIndex : uint,toIndex : uint) : IList;
	}
}
