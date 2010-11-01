package com.klstudio.datas {

	/**
	 * List
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class List extends Collection implements IList {
		public function List(c : * = null) {			
			if(c is Array) {
			}else if(c is ICollection) {
				c = (c as ICollection).toArray();
			} else {
				c = null;
			}
			super(c as Array);
		}

		public function addAt(index : uint,e : *) : void {
			if(index > size) {
				throw new Error("IndexOutOfBounds Index: " + index + ", Size: " + size);
			}
			elements.splice(index, 0, e);			
		}

		public function addAllAt(index : uint,c : ICollection) : void {
			if(index > size) {
				throw new Error("IndexOutOfBounds Index: " + index + ", Size: " + size);
			}
			if(c == null || c.isEmpty()) {
				return;
			}
			elements.splice.apply(elements, [index,0].concat(c.toArray()));
		}

		public function get(index : uint) : * {
			rangeCheck(index);
			return elements[index];
		}

		public function set(index : uint,e : *) : * {
			rangeCheck(index);
			var oldElement : * = elements[index];
			elements[index] = e;
			return oldElement;
		}

		public function indexOf(e : *) : int {
			return elements.indexOf(e);
		}

		public function lastIndexOf(e : *) : int {
			return elements.lastIndexOf(e);
		}

		public function removeAt(index : uint) : * {
			rangeCheck(index);
			var e : * = elements[index];
			elements.splice(index, 1);
			return e;
		}

		public function subList(fromIndex : uint,toIndex : uint) : IList {
			if(toIndex > size) {
				throw new Error("IndexOutOfBounds toIndex: " + toIndex + ", Size: " + size);
			}
			if(fromIndex > toIndex) {
				throw new Error("IllegalArgument fromIndex(" + fromIndex + ") > toIndex(" + toIndex + ")");
			}
			return new List(elements.slice(fromIndex, toIndex));
		}

		private function rangeCheck(index : uint) : void {
			if(index >= size) {
				throw new Error("IndexOutOfBounds Index: " + index + ", Size: " + size);
			}
		}

		override public function equals(object : *) : Boolean {
			if(object == this) {
				return true;
			}
			if(!(object is IList)) {
				return false;
			}
			var es : Array = toArray();
			var os : Array = (object as IList).toArray();
			while(es.length > 0 && os.length > 0) {
				var e : * = es.shift();
				var o : * = os.shift();
				if(!(e == o)) {
					return false;
				}
			}
			return !(es.length > 0 || os.length > 0);
		}

		override public function clone() : * {
			return new List(elements);
		}
	}
}
