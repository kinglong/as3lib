package com.klstudio.test {
	import flash.events.MouseEvent;

	import fl.controls.Button;

	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * SortDemo
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-10-29
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="24", width="400", height="300")]

	public class SortDemo extends Sprite {
		private var _caven : Shape;
		private var _len : uint;
		private var _sorting : Boolean;
		private var _ordered : Boolean;
		private var _arr : Array;
		private var _state : String;
		private var _k : uint;
		private var _txt : TextField;		

		public function SortDemo() {
			_len = 200;
			_k = 0;
			_sorting = false;
			_ordered = false;
			
			initLabel();
			initCaven();
			initButton();
			initArray();
			redraw();
			randomArr();					
		}

		private function initLabel() : void {
			var label : TextField;
			label = getLabel("<a href='http://www.klstudio.com/post/225.html' target='_blank'>排序算法演示</a>", getTextFormat(25, 0x000000, true, false), true);
			label.x = 5;
			label.y = 2;
			addChild(label);
			
			label = getLabel("Ver 1.0", getTextFormat());
			label.x = 170;
			label.y = 16;
			addChild(label);
			
			var fmt : TextFormat = getTextFormat(9, 0x000000, true, true);
			fmt.font = "Verdana";
			label = getLabel("<a href='http://www.klstudio.com/post/225.html' target='_blank'>Developed by Kinglong</a>", fmt, true);			
			label.x = 280;
			label.y = 20;
			addChild(label);
			
			label = getLabel("状态：", getTextFormat(13, 0, true));
			label.x = 2;
			label.y = 242;
			addChild(label);
			
			label = getLabel("排序算法：", getTextFormat(13, 0, true));
			label.x = 120;
			label.y = 242;
			addChild(label);
			
			_txt = getLabel("", getTextFormat(12, 0xFF0000));
			_txt.x = 190;
			_txt.y = 270;
			addChild(_txt);
		}

		private function initCaven() : void {
			graphics.lineStyle(1, 0xFF0000);
			_caven = new Shape();
			_caven.y = 40;
			graphics.moveTo(0, _caven.y - 2);
			graphics.lineTo(400, _caven.y - 2);
			graphics.moveTo(0, _caven.y + _len + 1);
			graphics.lineTo(400, _caven.y + _len + 1);
			addChild(_caven);
		}

		private function initButton() : void {
			var button : Button;
			button = getButton("随机排列", "random");
			button.move(45, 245);
			addChild(button);
			
			button = getButton("倒序排列", "reverse");
			button.move(45, 270);
			addChild(button);
			
			button = getButton("冒泡排序", "bubble");
			button.move(190, 245);
			addChild(button);
			
			button = getButton("插入排序", "insert");
			button.move(260, 245);
			addChild(button);
			
			button = getButton("选择排序", "select");
			button.move(330, 245);
			addChild(button);
		}

		private function initArray() : void {
			_arr = [];
			for(var i : uint = 0;i < _len;i++) {
				_arr[i] = i + 1;
			}
		}

		private function redraw() : void {
			_caven.graphics.clear();
			_caven.graphics.lineStyle(1, 0x000000);
			for(var i : uint = 0;i < _len;i++) {				
				_caven.graphics.moveTo(2 * i, _len);
				_caven.graphics.lineTo(2 * i, _len - _arr[i]);
			}
		}

		private function randomArr() : void {
			var t : uint;
			var r : uint;			
			for(var i : uint = 0;i < _len;i++) {
				r = uint(Math.random() * _len);
				t = _arr[i];
				_arr[i] = _arr[r];
				_arr[r] = t;				
			}
			_ordered = false;
			redraw();
		}

		private function reverseArr() : void {
			_arr = [];
			for(var i : uint = 0;i < _len;i++) {
				_arr[i] = i + 1;
			}
			_arr.reverse();
			_ordered = false;
			redraw();
		}

		private function enterFrameHandler(event : Event) : void {
			switch(_state) {
				case "bubble":
					bubbleSort();
					break;
				case "insert":
					insertSort();
					break;
				case "select":
					selectSort();
					break;
				default:
					removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}						
		}

		private function bubbleSort() : void {
			if(!hasEventListener(Event.ENTER_FRAME)) {
				_state = "bubble";
				_k = 0;
				addEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = true;
				
				_txt.text = "【冒泡排序】中...";
			}
			redraw();
			var t : uint;
			for(var i : uint = _k;i < _len;i++) {
				if(_arr[_k] > _arr[i] ) {
					t = _arr[_k];
					_arr[_k] = _arr[i];
					_arr[i] = t;
				}
			}
			if(_k < _len) {
				_k++;
			} else {
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = false;
				_ordered = true;
				_txt.text = "排序完成！";
			}
		}

		private function insertSort() : void {
			if(!hasEventListener(Event.ENTER_FRAME)) {
				_state = "insert";
				_k = 0;
				addEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = true;
				_txt.text = "【插入排序】中...";
			}
			redraw();
			var t : uint = _arr[_k];
			for(var i : uint = _k;i > 0 && t < _arr[i - 1];i--) {
				_arr[i] = _arr[i - 1];
			}
			_arr[i] = t;
			if(_k < _len) {
				_k++;
			} else {
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = false;
				_ordered = true;
				_txt.text = "排序完成！";
			}
		}

		private function selectSort() : void {
			if(!hasEventListener(Event.ENTER_FRAME)) {
				_state = "select";
				_k = 0;
				addEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = true;
				_txt.text = "【选择排序】中...";
			}
			redraw();
			var t : uint = _k;
			for(var i : uint = _k;i < _len;i++) {
				if(_arr[i] < _arr[t]) {
					t = i;
				}
			}
			var tmp : uint = _arr[_k];
			_arr[_k] = _arr[t];
			_arr[t] = tmp;
			if(_k < _len - 1) {
				_k++;
			} else {
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				_sorting = false;
				_ordered = true;
				_txt.text = "排序完成！";
			}
		}

		private function getTextFormat(size : uint = 12,color : uint = 0x000000,bold : Boolean = false,underline : Boolean = false) : TextFormat {
			var fmt : TextFormat = new TextFormat();
			fmt.size = size;
			fmt.color = color;
			fmt.bold = bold;
			fmt.underline = underline;
			return fmt;
		}

		private function getLabel(label : String,format : TextFormat,html : Boolean = false) : TextField {
			var txt : TextField = new TextField();
			txt.defaultTextFormat = format;
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.multiline = false;
			txt.selectable = false;
			txt.type = TextFieldType.DYNAMIC;
			if(html) {
				txt.htmlText = label;
			} else {
				txt.text = label;
			}
			return txt;
		}

		
		
		private function getButton(lbl : String,name : String) : Button {
			var button : Button = new Button();
			button.setStyle("textFormat", getTextFormat());
			button.width = 65;
			button.label = lbl;
			button.name = name;
			button.addEventListener(MouseEvent.CLICK, buttonHandler);
			return button;
		}

		private function buttonHandler(event : Event) : void {
			if(_sorting) {
				return;
			}
			switch(event.target["name"]) {
				case "bubble":
					if(!_ordered) {
						bubbleSort();
					}
					break;
				case "insert":
					if(!_ordered) {
						insertSort();
					}
					break;
				case "select":
					if(!_ordered) {
						selectSort();
					}
					break;
				case "random":
					randomArr();
					break;
				case "reverse":
					reverseArr();
					break;
			}
		}
	}
}
