package com.klstudio.test {
	import flash.geom.Point;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;

	/**
	 * Copyright
	 * @author kinglong@gmail.com
	 * @since 2011-3-8
	 */
	public class Copyright extends TextField {
		public function Copyright() {
			multiline = true;
			autoSize = TextFieldAutoSize.LEFT;
			selectable = false;
			htmlText = "<font face='verdana' size='9'><a href='http://www.klstudio.com' target='_blank'><font color='#FFCC00'><b>Kinglong's Blog</b></font><br/><font color='#FFFFFF'>http://www.klstudio.com</font></a></font>";
			filters = [new GlowFilter(0x000000, 1, 2, 2, 16)];
			if (stage) {
				addStageHandler();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, addStageHandler);
			}
		}

		private function addStageHandler(event : Event = null) : void {
			removeEventListener(Event.ADDED_TO_STAGE, addStageHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removeStageHandler);
			update();
			stage.addEventListener(Event.RESIZE, resizeStageHandler);
		}

		private function removeStageHandler(event : Event) : void {
			if (stage) {
				stage.removeEventListener(Event.RESIZE, resizeStageHandler);
			}
			removeEventListener(Event.REMOVED_FROM_STAGE, removeStageHandler);
		}

		private function resizeStageHandler(event : Event) : void {
			update();
		}

		public function update() : void {
			if (stage) {
				var offset : int = 10;
				var w : uint = stage.stageWidth;
				var h : uint = stage.stageHeight;
				var point : Point = parent.globalToLocal(new Point(w - width - offset, h - height - offset));
				x = point.x;
				y = point.y;
			}
		}
	}
}
