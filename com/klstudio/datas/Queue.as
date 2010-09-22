package com.klstudio.datas {

	/**
	 * 
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-9-22
	 */	

	public class Queue extends Collection implements IQueue {
		private var _maxSize : uint;

		public function Queue(elements : * = null,maxSize : uint = 0) {
			if(elements is ICollection) {
				elements = (elements as ICollection).toArray();
			}
			_maxSize = maxSize;
			super(elements);
		}

		public function element() : * {
			var e : * = peek();
			if(e == null) {
				throw new Error("Queue NoSuchElement");
			} else {
				return e;
			}			
		}

		
		override public function add(e : *) : Boolean {
			if(offer(e)) {
				return true;
			} else {
				throw new Error("Queue Full(" + _maxSize + ")");
			}
		}

		public function offer(e : *) : Boolean {
			// TODO: Auto-generated method stub
			if(e == null) {
				throw new Error("e is Null");
			}
			if(_maxSize == 0 || size < _maxSize) {
				elements.push(e);
				return true;
			} else {
				return false;
			}
		}

		public function peek() : * {			
			return isEmpty() ? null : elements[0];
		}

		public function poll() : * {
			return isEmpty() ? null : elements.shift();
		}

		public function removeElement() : * {
			var e : * = poll();
			if(e == null) {
				throw new Error("Queue NoSuchElement");
			} else {
				return e;
			}
		}

		override public function clone() : * {
			return new Queue(elements, _maxSize);
		}
	}
}
