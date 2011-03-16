package com.klstudio.effects {
	import flash.utils.Dictionary;
	import flash.events.Event;

	import com.klstudio.display.IClearable;
	import com.greensock.TweenMax;

	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	/**
	 * CameraEffect 镜头跟随特效
	 * @author kinglong@gmail.com
	 * @since 2011-3-4
	 */
	public class CameraEffect  implements IClearable {
		private static var _dict : Dictionary = new Dictionary(true);

		/**
		 * 获取特效实例
		 * @param role 角色对象
		 * @param offset 偏移值
		 * @param completeHandler 移动完成后回调事件
		 * @return CameraEffect 返回特效实例
		 */
		public static function getCameraEffect(role : DisplayObject, offset : uint = 5, completeHandler : Function = null) : CameraEffect {
			if (!_dict[role]) {
				_dict[role] = new CameraEffect(role, offset, completeHandler);
			}
			return _dict[role];
		}

		/**
		 * 清除特效实例
		 * @param role 角色对象
		 * @return CameraEffect 返回清除的特效实例
		 */
		public static function removeCameraEffect(role : DisplayObject) : CameraEffect {
			if (_dict[role]) {
				var effect : CameraEffect = _dict[role];
				delete _dict[role];
				return effect;
			}
			return null;
		}

		/**
		 * 清除所有特效实例
		 */
		public static function removeAllCameraEffect() : void {
			var effect : CameraEffect;
			for (var role : * in _dict) {
				trace(role);
				effect = removeCameraEffect(role);
				effect.dispose();
				effect = null;			
			}
		}

		private var _role : DisplayObject;
		private var _tween : TweenMax;
		private var _offset : uint;
		private var _parentRect : Rectangle;
		private var _completeHandler : Function;

		/**
		 * 构造
		 * @param role 角色对象
		 * @param offset 偏移值
		 * @param completeHandler 移动完成后回调事件
		 */
		public function CameraEffect(role : DisplayObject, offset : uint, completeHandler : Function) {
			if (role == null) {
				throw new Error("role不能为null");
			}
			if (role.parent == null) {
				throw new Error("role.parent不能为null");
			}
			if (role.parent.scrollRect == null) {
				throw new Error("role.parent.scrollRect不能为null");
			}
			_completeHandler = completeHandler;
			var rect : Rectangle = role.parent.scrollRect.clone();
			role.parent.scrollRect = null;
			_parentRect = role.parent.getBounds(null);
			role.parent.scrollRect = rect;
			_role = role;
			_offset = offset < 5 ? 5 : offset;
		}

		/**
		 * 角色显示对象
		 */
		public function get role() : DisplayObject {
			return _role;
		}

		/**
		 * 偏移量
		 */
		public function get offset() : uint {
			return _offset;
		}

		/**
		 * 镜头跟随位置
		 * @param x localX;
		 * @param y localY;
		 */
		public function follow(x : int, y : int) : void {
			TweenMax.killTweensOf(_tween);
			var rect : Rectangle = role.getBounds(null);
			if (x + rect.x < _parentRect.x) {
				x = _parentRect.x - rect.x;
			}
			if (x + rect.right > _parentRect.right) {
				x = _parentRect.right - rect.right;
			}
			if (y + rect.y < _parentRect.y) {
				y = _parentRect.y - rect.y;
			}
			if (y + rect.bottom > _parentRect.bottom) {
				y = _parentRect.bottom - rect.bottom;
			}
			_tween = TweenMax.to(role, 0.8, {x:x, y:y, onUpdate:updateHandler, onUpdateParams:[rect], onComplete:completeHandler});
		}

		/**
		 * 镜头跟随位置(全局坐标)
		 * @param point Stage坐标点;		
		 */
		public function followPosition(point : Point) : void {
			if (point == null || role.parent == null) {
				return;
			}
			var local : Point = role.parent.globalToLocal(point);
			follow(local.x, local.y);
		}

		/**
		 * 设置位置
		 * @param x localX;
		 * @param y localY;
		 * @param effect 是否有缓冲效果
		 */
		public function move(x : int, y : int, effect : Boolean = true) : void {
			TweenMax.killTweensOf(_tween);
			var rect : Rectangle = role.getBounds(null);
			if (x + rect.x < _parentRect.x) {
				x = _parentRect.x - rect.x;
			}
			if (x + rect.right > _parentRect.right) {
				x = _parentRect.right - rect.right;
			}
			if (y + rect.y < _parentRect.y) {
				y = _parentRect.y - rect.y;
			}
			if (y + rect.bottom > _parentRect.bottom) {
				y = _parentRect.bottom - rect.bottom;
			}
			if (effect) {
				_tween = TweenMax.to(role, 0.8, {x:x, y:y, onComplete:completeHandler});
			} else {
				role.x = x;
				role.y = y;
				completeHandler();
			}
		}

		/**
		 * 设置位置(全局坐标)
		 * @param point Stage坐标点;		
		 */
		public function movePosition(point : Point, effect : Boolean = true) : void {
			if (point == null || role.parent == null) {
				return;
			}
			var local : Point = role.parent.globalToLocal(point);
			move(local.x, local.y, effect);
		}

		private function completeHandler() : void {
			TweenMax.killTweensOf(_tween);
			if (_completeHandler != null) {
				if (_completeHandler.length == 0) {
					_completeHandler();
				} else {
					_completeHandler(role);
				}
			}
		}

		private function updateHandler(roleRect : Rectangle) : void {
			if (role == null || role.parent == null) {
				TweenMax.killTweensOf(_tween);
				return;
			}
			var rect : Rectangle = role.parent.scrollRect;
			role.x = int(role.x);
			role.y = int(role.y);
			if (role.x + roleRect.x < rect.x + offset) {
				rect.x = role.x + roleRect.x - offset;
				if (rect.x < _parentRect.x) {
					rect.x = _parentRect.x;
				}
			}
			if (role.x + roleRect.right > rect.x + rect.width - offset) {
				rect.x = role.x + roleRect.right - rect.width + offset;
				if (rect.right > _parentRect.right) {
					rect.x = _parentRect.right - rect.width;
				}
			}
			if (role.y + roleRect.y < rect.y + offset) {
				rect.y = role.y + roleRect.y - offset;
				if (rect.y < _parentRect.y) {
					rect.y = _parentRect.y;
				}
			}
			if (role.y + roleRect.bottom > rect.y + rect.height - offset) {
				rect.y = role.y + roleRect.bottom - rect.height + offset;
				if (rect.bottom > _parentRect.bottom) {
					rect.y = _parentRect.bottom - rect.height;
				}
			}
			role.parent.scrollRect = rect;
		}

		public function dispose() : void {
			TweenMax.killTweensOf(_tween);
		}
	}
}
