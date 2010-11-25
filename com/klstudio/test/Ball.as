package com.klstudio.test {
	import flash.display.Shape;

	/**
	 * Ball
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-11-25
	 */
	public class Ball extends Shape {
		/**
		 * X坐标上的加速度;
		 */
		public var vx : Number;
		/**
		 * Y坐标上的加速度;
		 */
		public var vy : Number;
		/**
		 * 半径;
		 */
		public var radius : Number;

		public function Ball(radius : Number = 10, color : uint = 0xFF0000) {
			vx = 0;
			vy = 0;
			this.radius = radius;
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}
