package com.klstudio.test {
	import flash.geom.Rectangle;
	import flash.utils.getTimer;

	import fl.controls.TextArea;
	import fl.events.SliderEvent;
	import fl.controls.Slider;

	import flash.display.Shape;
	import flash.display.Loader;
	import flash.system.Security;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.FileFilter;

	import fl.controls.Button;
	import fl.containers.ScrollPane;

	import com.klstudio.utils.BitmapDataUtil;

	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * TestImageMapVector
	 * @author kinglong@gmail.com
	 * @since 2011-3-17
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="24", width="550", height="400")]
	public class TestImageMapVector extends Sprite {
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
		private var _mask : Shape;
		private var _sd : Slider;
		private var _output : TextArea;

		public function TestImageMapVector() {
			Security.allowDomain("*");
			_btn = new Button();
			_btn.label = "Browse Image";
			_btn.move(5, 5);
			_btn.setSize(100, 40);
			_btn.addEventListener(MouseEvent.CLICK, clickHandler);
			addChild(_btn);

			_sd = new Slider();
			_sd.minimum = 4;
			_sd.maximum = 50;
			_sd.value = 8;
			_sd.move(_btn.x + _btn.width + 5, _btn.y + 10);
			_sd.setSize(100, _sd.height);
			_sd.tickInterval = 1;
			_sd.addEventListener(SliderEvent.CHANGE, changeHandler);
			addChild(_sd);

			_output = new TextArea();
			_output.editable = false;
			_output.setSize(330, _btn.height);
			_output.move(_sd.x + _sd.width + 5, _btn.y);
			addChild(_output);

			_bmp = new Bitmap();
			_canvas = new Sprite();
			_canvas.addChild(_bmp);
			_mask = new Shape();
			_canvas.addChild(_mask);

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
			if (bitmapData == null || !bitmapData.transparent) {
				setAllEnabled(true);
				return;
			}
			if (_bmp.bitmapData) {
				_bmp.bitmapData.dispose();
			}
			_bmp.bitmapData = bitmapData;
			var w : uint = Math.max(550, _bmp.width);
			var h : uint = Math.max(350, _bmp.height);
			_canvas.graphics.clear();
			_canvas.graphics.beginBitmapFill(texture);
			_canvas.graphics.drawRect(0, 0, w, h);
			_canvas.graphics.endFill();
			_pane.refreshPane();
			updateBox(_sd.value);
		}

		public function updateBox(cellSize : uint) : void {
			setAllEnabled(false);
			var out : String = "图片大小：" + _bmp.width + "X" + _bmp.height;
			var rect : Rectangle = BitmapDataUtil.getRealImageRect(_bmp.bitmapData);
			out += "   图片实际区域：[" + rect.x + "," + rect.y + "," + rect.width + "," + rect.height + "]\n";
			var time : Number = getTimer();
			var map : Vector.<Vector.<int>> = BitmapDataUtil.getImageMapVector(_bmp.bitmapData, cellSize);
			out += "方格大小：" + cellSize;
			out += "   方法执行时间：" + (getTimer() - time) + "ms";
			_mask.graphics.clear();
			for (var x : int = 0; x < map.length; x++) {
				for (var y : int = 0; y < map[x].length; y++) {
					if (map[x][y] == 1) {
						_mask.graphics.lineStyle(0, 0xFF0000, 0.2);
						_mask.graphics.beginFill(0x00FFFF, 0.4);
						_mask.graphics.drawRect(x * cellSize, y * cellSize, cellSize, cellSize);
						_mask.graphics.endFill();
					}
				}
			}
			_output.text = out;
			setAllEnabled(true);
		}

		private	function fileHandler(event : Event) : void {
			switch(event.type) {
				case Event.COMPLETE:
					_loader.loadBytes(_file.data);
					break;
				case Event.SELECT:
					_file.load();
					setAllEnabled(false);
					break;
			}
		}

		private function setAllEnabled(enable : Boolean) : void {
			_btn.enabled = enable;
			_sd.enabled = enable;
		}

		private function clickHandler(event : MouseEvent) : void {
			_file.browse(_filters);
		}

		private function changeHandler(event : Event) : void {
			updateBox(_sd.value);
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
