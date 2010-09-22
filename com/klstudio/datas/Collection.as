package com.klstudio.datas {
	import com.klstudio.core.CoreObject;

	/**
	 * Collection
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class Collection extends CoreObject implements ICollection{
		private var _elements : Array;

		public function Collection(elements:Array = null) {
			_elements = [];
			if(elements != null && elements.length > 0) {
				_elements = elements.concat();
			}
		}

		protected function get elements() : Array {
			return _elements;
		}		

		public function clear() : void {
			_elements = [];
		}

		public function add(e : *) : Boolean {
			_elements.push(e);
			return true;
		}

		public function addAll(collection : ICollection) : Boolean {			
			if(collection == null || collection.isEmpty()) {
				return false;
			}
			var modified : Boolean = false;
			var len : uint = collection.size;
			var elements : Array = collection.toArray();
			for(var i : uint = 0;i < len;i++) {
				if(add(elements[i])) {
					modified = true;
				}
			}
			return modified;
		}

		public function contains(e : *) : Boolean {
			return _elements.indexOf(e) != -1;
		}

		public function containsAll(collection : ICollection) : Boolean {
			if(collection == null || collection.isEmpty() || isEmpty()) {
				return false;
			}
			var len : uint = collection.size;
			var elements : Array = collection.toArray();
			for(var i : uint = 0;i < len;i++) {
				if(!contains(elements[i])) {
					return false;
				}
			}
			return true;
		}

		public function get size() : uint {
			return _elements.length;
		}

		public function isEmpty() : Boolean {
			return size == 0;
		}

		public function remove(e : *) : Boolean {
			var index : int = _elements.indexOf(e);
			if(index != -1) {
				_elements.splice(index, 1);
				return true;
			}
			return false;
		}

		public function removeAll(collection : ICollection) : Boolean {
			if(collection == null || collection.isEmpty() || isEmpty()) {
				return false;
			}
			var modified : Boolean = false;
			var len : uint = size;
			var elements : Array = toArray();
			for(var i : uint = 0;i < len;i++) {
				if(collection.contains(elements[i])) {
					remove(elements[i]);
					modified = true;
				}
			}
			return modified;
		}

		public function retainAll(collection : ICollection) : Boolean {
			if(collection == null || isEmpty()) {
				return false;
			}
			var modified : Boolean = false;
			var len : uint = size;
			var elements : Array = toArray();
			for(var i : uint = 0;i < len;i++) {
				if(!collection.contains(elements[i])) {
					remove(elements[i]);
					modified = true;
				}
			}
			return modified;
		}

		public function toArray() : Array {
			return _elements.concat();
		}

		override public function toString() : String {
			return "["+getClassName()+" size=" + size + ",elements=[" + elements.join(",")+ "]]";
		}		
		
		override public function clone() : * {
			// TODO: Auto-generated method stub
			return new Collection(elements);
		}
	}
}
