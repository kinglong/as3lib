package com.klstudio.test {
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * Fountain
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-11-17
	 */
	public class Fountain extends Sprite {
		public static const COUNT : uint = 100;
		private var _maxWidth : Number;
		private var _maxHeight : Number;
		private var _balls : Array;
		/**
		 * 重力系数
		 */
		public var gravity : Number = 0.9;
		/**
		 * 风力系数
		 */
		public var wind : Number = 0.2;

		public function Fountain(maxWidth : Number = 0, maxHeight : Number = 0) {
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
			_balls = [];
			var ball : Ball;
			for (var i : uint = 0;i < COUNT;i++) {
				ball = new Ball(2, Math.random() * 0xFFFFFF);
				initBall(ball);
				addChild(ball);
				_balls.push(ball);
			}
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function initBall(ball : Ball) : void {
			ball.x = _maxWidth / 2;
			ball.y = _maxHeight;
			ball.vx = Math.random() * 2 - 1;
			ball.vy = Math.random() * -10 - 10;
		}

		private function enterFrameHandler(event : Event) : void {
			for each (var ball : Ball in _balls) {
				ball.vx += wind;
				ball.vy += gravity;
				ball.x += ball.vx;
				ball.y += ball.vy;
				if (ball.x - ball.radius > _maxWidth || ball.x + ball.radius < 0 || ball.y - ball.radius > _maxHeight || ball.y + ball.radius < 0) {
					initBall(ball);
				}
			}
		}
	}
}