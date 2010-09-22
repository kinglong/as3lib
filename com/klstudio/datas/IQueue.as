package com.klstudio.datas {
	import com.klstudio.datas.ICollection;

	/**
	 * IQueue 与java.util.Queue类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public interface IQueue extends ICollection {
		function element() : *;

		function offer(e : *) : Boolean;

		function peek() : *;

		function poll() : *;

		function removeElement() : *;
	}
}
