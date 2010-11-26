package com.klstudio.test {
	import flash.geom.Point;
	import flash.display.Sprite;

	/**
	 * Segment
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-11-26
	 */
	public class Segment extends Sprite {
		private var _color : uint;
		private var _segmentWidth : Number;
		private var _segmentHeight : Number;
		public var vx : Number = 0;
		public var vy : Number = 0;

		public function Segment(segmentWidth : Number, segmentHeight : Number, color : uint = 0xFFFFFF) {
			_segmentWidth = segmentWidth;
			_segmentHeight = segmentHeight;
			_color = color;
			init();
		}

		private function init() : void {
			// draw the segment itself
			graphics.lineStyle(0);
			graphics.beginFill(_color);
			graphics.drawRoundRect(-_segmentHeight / 2, -_segmentHeight / 2, _segmentWidth + _segmentHeight, _segmentHeight, _segmentHeight, _segmentHeight);
			graphics.endFill();

			// draw the two "pins"
			graphics.drawCircle(0, 0, 2);
			graphics.drawCircle(_segmentWidth, 0, 2);
		}

		public function get originPoint() : Point {
			var angle : Number = rotation * Math.PI / 180;
			var xPos : Number = x + Math.cos(angle) * _segmentWidth;
			var yPos : Number = y + Math.sin(angle) * _segmentWidth;
			return new Point(xPos, yPos);
		}
	}
}
