package com.klstudio.datas {

	/**
	 * Stack 与java.util.Stack类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class Stack extends List implements IList {
		public function Stack() {			
		}

		public function empty() : Boolean {
			return isEmpty();
		}

		public function peek() : * {
			var len : uint = size;
			if(len == 0) {
				throw new Error("EmptyStack");
			}
			return elements[len - 1];
		}

		public function pop() : * {
			var len : uint = size;
			if(len == 0) {
				throw new Error("EmptyStack");
			}
			return elements.pop();
		}

		public function push(e : *) : * {
			elements.push(e);
			return e;
		}

		public function search(e : *) : int {
			return elements.lastIndexOf(e);
		}
	}
}
