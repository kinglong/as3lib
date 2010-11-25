package com.klstudio.test {
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * Throwing
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-11-25
	 */
	public class Throwing extends Sprite {
		private var _maxWidth : Number;
		private var _maxHeight : Number;
		private var _ball : Ball;
		private var _oldX : Number;
		private var _oldY : Number;
		private var _rect : Rectangle;
		/**
		 * 重力系数
		 */
		public var gravity : Number = 0.5;
		/**
		 * 反弹力系数
		 */
		public var bounce : Number = -0.7;

		public function Throwing(maxWidth : Number = 0, maxHeight : Number = 0) {
			if (maxHeight > 0 && maxWidth > 0) {
				_maxWidth = maxWidth;
				_maxHeight = maxHeight;
			} else {
				_maxWidth = stage.stageWidth;
				_maxHeight = stage.stageHeight;
			}
			init();
		}

		private function init() : void {
			_ball = new Ball(30);
			_ball.x = 550 / 2;
			_ball.y = 400 / 2;
			_ball.vx = Math.random() * 10 - 5;
			_ball.vy = -10;
			_ball.useHandCursor = true;
			addChild(_ball);
			_rect = new Rectangle(0, 0, _maxWidth, _maxHeight);
			_ball.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function enterFrameHandler(event : Event) : void {
			_ball.vy += gravity;
			_ball.x += _ball.vx;
			_ball.y += _ball.vy;
			/**
			 * 边界
			 */
			if (_ball.x + _ball.radius > _rect.right) {
				_ball.x = _rect.right - _ball.radius;
				_ball.vx *= bounce;
			} else if (_ball.x - _ball.radius < _rect.left) {
				_ball.x = _rect.left + _ball.radius;
				_ball.vx *= bounce;
			}
			if (_ball.y + _ball.radius > _rect.bottom) {
				_ball.y = _rect.bottom - _ball.radius;
				_ball.vy *= bounce;
			} else if (_ball.y - _ball.radius < _rect.top) {
				_ball.y = _rect.top + _ball.radius;
				_ball.vy *= bounce;
			}
		}

		private function mouseDownHandler(event : MouseEvent) : void {
			_oldX = _ball.x;
			_oldY = _ball.y;
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			_ball.startDrag();
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			addEventListener(Event.ENTER_FRAME, trackVelocityHandler);
		}

		private function mouseUpHandler(event : MouseEvent) : void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			_ball.stopDrag();
			removeEventListener(Event.ENTER_FRAME, trackVelocityHandler);
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function trackVelocityHandler(event : Event) : void {
			_ball.vx = _ball.x - _oldX;
			_ball.vy = _ball.y - _oldY;
			_oldX = _ball.x;
			_oldY = _ball.y;
		}
	}
}
