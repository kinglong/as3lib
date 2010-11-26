package com.klstudio.test {
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * PlayBall
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-11-26
	 */
	public class PlayBall extends Sprite {
		private var _maxWidth : Number;
		private var _maxHeight : Number;
		private var _ball : Ball;
		private var _numSegments : uint = 4;
		private var _leftPlayer : Array;
		private var _rightPlayer : Array;
		/**
		 * 重力系数
		 */
		public var gravity : Number = 0.5;
		/**
		 * 反弹力系数
		 */
		public var bounce : Number = -0.9;

		public function PlayBall(maxWidth : Number = 0, maxHeight : Number = 0) {
			mouseEnabled = mouseChildren = false;
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
			_ball = new Ball(20);
			_ball.vx = 10;
			addChild(_ball);
			_leftPlayer = getPlayer();
			_leftPlayer[_numSegments - 1].x = _maxWidth / 8;
			_leftPlayer[_numSegments - 1].y = _maxHeight;
			_rightPlayer = getPlayer();
			_rightPlayer[_numSegments - 1].x = _maxWidth / 8 * 7;
			_rightPlayer[_numSegments - 1].y = _maxHeight;

			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function getPlayer() : Array {
			var arr : Array = [];
			for (var i : uint = 0;i < _numSegments;i++) {
				var segment : Segment = new Segment(i * 5 + 35, 10);
				addChild(segment);
				arr.push(segment);
			}
			return arr;
		}

		private function enterFrameHandler(event : Event) : void {
			moveBall();
			movePlayer(_leftPlayer);
			movePlayer(_rightPlayer);

			checkHit(_leftPlayer, Math.random() * 3 + 1);
			checkHit(_rightPlayer, Math.random() * -3 - 1);
		}

		private function reach(segment : Segment, xpos : Number, ypos : Number) : Point {
			var dx : Number = xpos - segment.x;
			var dy : Number = ypos - segment.y;
			var angle : Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;

			var w : Number = segment.originPoint.x - segment.x;
			var h : Number = segment.originPoint.y - segment.y;
			var tx : Number = xpos - w;
			var ty : Number = ypos - h;
			return new Point(tx, ty);
		}

		private function position(segmentA : Segment, segmentB : Segment) : void {
			segmentA.x = segmentB.originPoint.x;
			segmentA.y = segmentB.originPoint.y;
		}

		private function movePlayer(segments : Array) : void {
			var target : Point = reach(segments[0], _ball.x, _ball.y);
			for (var i : uint = 1; i < _numSegments; i++) {
				var segment : Segment = segments[i];
				target = reach(segment, target.x, target.y);
			}
			for (i = _numSegments - 1; i > 0; i--) {
				var segmentA : Segment = segments[i];
				var segmentB : Segment = segments[i - 1];
				position(segmentB, segmentA);
			}
		}

		private function moveBall() : void {
			_ball.vy += gravity;
			_ball.x += _ball.vx;
			_ball.y += _ball.vy;
			if (_ball.x + _ball.radius > _maxWidth) {
				_ball.x = _maxWidth - _ball.radius;
				_ball.vx *= bounce;
			} else if (_ball.x - _ball.radius < 0) {
				_ball.x = _ball.radius;
				_ball.vx *= bounce;
			}
			if (_ball.y + _ball.radius > _maxHeight) {
				_ball.y = _maxHeight - _ball.radius;
				_ball.vy *= bounce;
			} else if (_ball.y - _ball.radius < 0) {
				_ball.y = _ball.radius;
				_ball.vy *= bounce;
			}
		}

		public function checkHit(segments : Array, vx : int) : void {
			var segment : Segment = segments[0];
			var dx : Number = segment.originPoint.x - _ball.x;
			var dy : Number = segment.originPoint.y - _ball.y;
			var dist : Number = Math.sqrt(dx * dx + dy * dy);
			if (dist < _ball.radius) {
				_ball.vx += vx;
				_ball.vy -= Math.random() * 2 + 1;
			}
		}
	}
}
