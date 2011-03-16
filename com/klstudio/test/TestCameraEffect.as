package com.klstudio.test {
	import flash.geom.Point;
	import flash.filters.GlowFilter;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;

	import com.klstudio.effects.CameraEffect;

	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;

	/**
	 * TestCameraEffect
	 * @author kinglong@gmail.com
	 * @since 2011-3-8
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="24", width="400", height="300")]
	public class TestCameraEffect extends Sprite {
		[Embed(source="box.png")]
		private var BoxImage : Class;
		private var _sp : Sprite;
		private var _fronts : Array;

		public function TestCameraEffect() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			_sp = new Sprite();
			_sp.graphics.beginBitmapFill(Bitmap(new BoxImage()).bitmapData, null, true, true);
			_sp.graphics.drawRect(0, 0, 600, 500);
			_sp.graphics.endFill();
			_sp.scrollRect = new Rectangle(0, 0, 400, 300);
			_fronts = [];
			addChild(_sp);
			addChild(new Copyright());
			var rect : Sprite = getSprite("rect", _sp);
			CameraEffect.getCameraEffect(rect, 10, completeHandler).move(250, 20, true);
			CameraEffect.getCameraEffect(getSprite("circle", _sp), 10, completeHandler).move(580, 200, true);

			rect.filters = [getGlowFilter()];
		}

		private function getSprite(name : String, container : DisplayObjectContainer) : Sprite {
			var sp : Sprite = new Sprite();
			sp.buttonMode = true;
			switch(name) {
				case "rect":
					sp.graphics.beginFill(0);
					sp.graphics.drawRect(0, 0, 20, 20);
					sp.graphics.endFill();
					sp.name = "rect";
					break;
				case "circle":
					sp.graphics.beginFill(0);
					sp.graphics.drawCircle(0, 0, 10);
					sp.graphics.endFill();
					sp.name = "circle";
					break;
			}
			container.addChild(sp);
			sp.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
			_fronts.push(sp);
			return sp;
		}

		private function mouseOverHandler(event : MouseEvent) : void {
			var sp : Sprite = event.target as Sprite;
			if (sp.filters.length == 0) {
				sp.filters = [getGlowFilter()];
			}
			for each (var item : Sprite in _fronts) {
				if (item != sp && item.filters) {
					item.filters = [];
				}
			}
		}

		private function getGlowFilter() : GlowFilter {
			return new GlowFilter(0xFFFFFF, 1, 10, 10, 3);
		}

		private function completeHandler(sp : DisplayObject) : void {
			var point : Point = new Point();
			switch(sp.name) {
				case "rect":
					if (sp.y < 200) {
						point.x = sp.x;
						point.y = 480;
					} else {
						point.x = sp.x;
						point.y = 20;
					}
					break;
				case "circle":
					if (sp.x < 250) {
						point.x = 580;
						point.y = sp.y;
					} else {
						point.x = 20;
						point.y = sp.y;
					}
					break;
			}
			if (sp.filters.length == 0) {
				CameraEffect.getCameraEffect(sp).move(point.x, point.y);
			} else {
				CameraEffect.getCameraEffect(sp).follow(point.x, point.y);
			}
		}
	}
}
