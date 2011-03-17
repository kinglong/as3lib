package com.klstudio.test {
	import flash.display.Loader;
	import flash.system.Security;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.FileFilter;
	import flash.text.TextFormat;

	import fl.controls.Button;

	import flash.geom.Rectangle;

	import fl.containers.ScrollPane;

	import com.klstudio.utils.BitmapDataUtil;

	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * TestRealImageRect
	 * @author kinglong@gmail.com
	 * @since 2011-3-17
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="24", width="550", height="400")]
	public class TestRealImageRect extends Sprite {
		private static const texture : BitmapData = BitmapDataUtil.getAlphaTextureBitmapData();
		[Embed(source="image.png")]
		private var ImageClass : Class;
		private var _canvas : Sprite;
		private var _pane : ScrollPane;
		private var _bmp : Bitmap;
		private var _btn : Button;
		private var _filters : Array;
		private var _file : FileReference;
		private var _loader : Loader;

		public function TestRealImageRect() {
			Security.allowDomain("*");
			_btn = new Button();
			_btn.label = "Browse Image";
			_btn.move(5, 5);
			_btn.setSize(540, 40);
			_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			addChild(_btn);

			_bmp = new Bitmap();
			_canvas = new Sprite();
			_canvas.addChild(_bmp);

			_pane = new ScrollPane();
			_pane.move(0, 50);
			_pane.setSize(550, 350);
			_pane.source = _canvas;
			addChild(_pane);

			addChild(new Copyright());

			updateImage(Bitmap(new ImageClass()).bitmapData);

			_filters = [];
			var filter : FileFilter;
			filter = new FileFilter("所有支持图片文件(*.gif,*.png)", "*.gif;*.png");
			_filters[_filters.length] = filter;
			filter = new FileFilter("GIF files (*.gif)", "*.gif");
			_filters[_filters.length] = filter;
			filter = new FileFilter("PNG files(*.png)", "*.png");
			_filters[_filters.length] = filter;

			_file = new FileReference();
			_file.addEventListener(Event.COMPLETE, fileHandler);
			_file.addEventListener(Event.SELECT, fileHandler);

			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadHandler);
		}

		public function updateImage(bitmapData : BitmapData) : void {
			if (_bmp.bitmapData) {
				_bmp.bitmapData.dispose();
			}
			_bmp.bitmapData = bitmapData;
			var w : uint = Math.max(550, _bmp.width);
			var h : uint = Math.max(350, _bmp.height);
			var rect : Rectangle = BitmapDataUtil.getRealImageRect(bitmapData);
			_canvas.graphics.clear();
			_canvas.graphics.beginBitmapFill(texture);
			_canvas.graphics.drawRect(0, 0, w, h);
			_canvas.graphics.endFill();
			_canvas.graphics.lineStyle(0, 0xFF0000);
			_canvas.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			_canvas.graphics.endFill();
			_pane.refreshPane();
		}

		private	function fileHandler(event : Event) : void {
			switch(event.type) {
				case Event.COMPLETE:
					_loader.loadBytes(_file.data);
					break;
				case Event.SELECT:
					_file.load();
					break;
			}
		}

		private function clickHandler(event : MouseEvent) : void {
			_file.browse(_filters);
		}

		private function loadHandler(event : Event) : void {
			var bmp : Bitmap = _loader.content as Bitmap;
			if (bmp) {
				updateImage(bmp.bitmapData);
			}
			_loader.unloadAndStop();
		}
	}
}
