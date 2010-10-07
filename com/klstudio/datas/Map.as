package com.klstudio.datas {
	import flash.utils.Dictionary;

	import com.klstudio.core.CoreObject;

	/**
	 * Map
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class Map extends CoreObject implements IMap {
		private var _keys : Array;
		private var _props : Dictionary;

		public function Map() {
			_keys = [];
			_props = new Dictionary();			
		}

		public function clear() : void {
			_keys = [];
			_props = new Dictionary();
		}

		public function containsKey(key : *) : Boolean {
			return _keys.indexOf(key) != -1;
		}

		public function containsValue(value : *) : Boolean {
			for each (var item : * in _props) {
				if(item == value) {
					return true;
				}
			}
			return false;
		}

		public function get(key : *) : * {
			return _props[key];
		}

		public function put(key : *,value : *) : * {
			var result : * = null;
			if(containsKey(key)) {
				result = get(key);
				_props[key] = value;
			} else {
				_keys.push(key);
				_props[key] = value;
			}
			return result;
		}

		public function remove(key : *) : * {
			var result : * = null;
			if(containsKey(key)) {
				result = _props[key];
				delete _props[key];
				var index : int = _keys.indexOf(key);
				if(index != -1) {
					_keys.splice(index, 1);
				}
			}
			return result;
		}

		public function putAll(map : IMap) : void {
			clear();
			var len : uint = map.size;
			if(len > 0) {
				var keys : Array = map.keys;
				for (var i : uint = 0;i < len;i++) {
					put(keys[i], map.get(keys[i]));
				}
			}
		}

		public function get size() : uint {
			return _keys.length;
		}

		public function isEmpty() : Boolean {
			return _keys.length == 1;
		}

		public function get keys() : Array {
			return _keys.concat();
		}

		public function get values() : Array {
			var result : Array = new Array(size);
			var len : uint = size;
			if(len > 0) {
				for each(var item : * in _props) {
					result.push(item);
				}
			}
			return result;
		}

		override public function toString() : String {
			return "[" + getClassName() + " size=" + size + "]";
		}

		override public function equals(object : *) : Boolean {
			// TODO: Auto-generated method stub
			if(object == this) {
				return true;
			}
			if(!(object is IMap)) {
				return false;
			}
			var om : IMap = object as IMap;
			if(om.size != size) {
				return false;
			}
			for each (var key : * in _keys) {
				if(get(key) != om.get(key)) {
					return false;
				}
			}
			return true;
		}

		override public function clone() : * {
			var nm : Map = new Map();
			nm.putAll(this);
			return nm;
		}
	}
}
