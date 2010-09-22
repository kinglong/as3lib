package com.klstudio.datas {

	/**
	 * Set 与java.util.HashSet类似
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class Set extends Collection implements ICollection {
		private static const PRESENT : Object = {};

		private var _map : Map;

		public function Set(elements : * = null) {
			_map = new Map();
			if(elements is Array) {
				addAll(new Collection(elements));
			}else if(elements is ICollection) {
				addAll(elements);
			}
		}		

		override public function add(e : *) : Boolean {
			return _map.put(e, PRESENT) == null;
		}

		
		override public function clear() : void {
			_map.clear();
		}

		
		override public function get size() : uint {
			return _map.size;
		}

		
		override public function isEmpty() : Boolean {
			return _map.isEmpty();
		}

		
		override public function contains(e : *) : Boolean {
			return _map.containsKey(e);
		}

		
		override public function remove(e : *) : Boolean {
			return _map.remove(e) == PRESENT;
		}

		
		override public function removeAll(c : ICollection) : Boolean {
			if(c == null || c.isEmpty() || isEmpty()) {
				return false;
			}
			var modified : Boolean = false;
			var gt : Boolean = size > c.size;			
			var len : uint = gt ? c.size : size;
			var elements : Array = gt ? c.toArray() : toArray();
			for (var i : uint = 0;i < len;i++) {
				var e : * = elements[i];
				if(gt) {
					modified ||= remove(e);
				}else if(c.contains(e)) {
					remove(e);
					modified = true;
				}
			}	
			return modified;
		}

		
		override public function toArray() : Array {
			return _map.keys;
		}

		
		override public function equals(object : *) : Boolean {
			if(object == this) {
				return true;
			}
			if(!(object is ICollection)) {
				return false;
			}
			var oc : ICollection = object as ICollection;
			if(size != oc.size) {
				return false;
			}
			return containsAll(oc);
		}

		override public function toString() : String {
			return "[" + getClassName() + " size=" + size + ",elements=[" + toArray().join(",") + "]]";
		}

		
		override public function clone() : * {
			var ns : Set = super.clone();
			ns._map = _map.clone();
			return ns;
		}		
	}
}
