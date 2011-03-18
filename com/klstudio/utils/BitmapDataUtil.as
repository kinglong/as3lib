package com.klstudio.utils {
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.display.BitmapData;

	/**
	 * BitmapDataUtil
	 * @author Kinglong(kinglong@gmail.com)
	 * @since 2011-1-8
	 */
	public class BitmapDataUtil {
		/**
		 * 替换位图指定颜色值;
		 * @param bitmapData 位图;
		 * @param color 需要替换的颜色(ARBG);
		 * @param repColor 替换的颜色(ARBG);
		 * @param mask 用于隔离颜色成分的遮罩(ARBG 0x00FF0000);
		 */
		public static function replaceColor(bitmapData : BitmapData, color : uint, repColor : uint, mask : uint = 0x00FFFFFF) : void {
			if (bitmapData == null || bitmapData.width < 1) {
				return;
			}
			bitmapData.threshold(bitmapData, bitmapData.rect, new Point(), "==", color, repColor, mask, true);
		}

		/**
		 * 获取图片真实大小（去除透明部分）
		 * @param bitmapData 位图;
		 * @return Rectangle
		 */
		public static function getRealImageRect(bitmapData : BitmapData) : Rectangle {
			if (bitmapData == null || bitmapData.width < 1) {
				return new Rectangle();
			}
			return bitmapData.getColorBoundsRect(0xFF000000, 0, false);
		}

		/**
		 * 是否空图片(去除透明部分)
		 * @param bitmapData 位图;
		 * @return
		 */
		public static function isEmptyImage(bitmapData : BitmapData) : Boolean {
			if (bitmapData == null || bitmapData.width < 1) {
				return false;
			}
			return getRealImageRect(bitmapData).equals(new Rectangle());
		}

		/**
		 * 获取位图区域数组(0为障碍 1为通路)
		 * @param bitmapData 位图
		 * @param cellSize 方格大小
		 * @return 区域数组
		 */
		public static function getImageMapVector(bitmapData : BitmapData, cellSize : uint = 8) : Vector.<Vector.<int>> {
			if (bitmapData == null || !bitmapData.transparent ) {
				throw new Error("bitmapData值无效");
			}
			if (cellSize < 4) {
				cellSize = 4;
			} else if (cellSize > 50) {
				cellSize = 50;
			}
			var rect : Rectangle = BitmapDataUtil.getRealImageRect(bitmapData);
			var maxX : int = Math.ceil(rect.right / cellSize);
			var maxY : int = Math.ceil(Math.ceil(rect.bottom / cellSize));
			var startX : int = Math.floor(rect.left / cellSize);
			var startY : int = Math.floor(rect.top / cellSize);
			var map : Vector.<Vector.<int>> = new Vector.<Vector.<int>>(maxX);
			var x : int;
			var y : int;
			var checkRect : Rectangle = new Rectangle(0, 0, cellSize, cellSize);
			var checkBmd : BitmapData = new BitmapData(cellSize, cellSize, true, 0);
			var point : Point = new Point();
			for ( x = 0; x < startX; x++) {
				map[x] = new Vector.<int>(maxY);
			}
			for (x = startX; x < maxX; x++) {
				map[x] = new Vector.<int>(maxY);
				for (y = startY; y < maxY; y++) {
					checkRect.x = x * cellSize;
					checkRect.y = y * cellSize;
					checkBmd.copyPixels(bitmapData, checkRect, point);
					if (!BitmapDataUtil.isEmptyImage(checkBmd)) {
						map[x][y] = 1;
					}
				}
			}
			checkBmd.dispose();
			checkRect = null;
			rect = null;
			point = null;
			return map;
		}

		/**
		 * 获取透明背景纹理
		 */
		public static function getAlphaTextureBitmapData() : BitmapData {
			var shape : Shape = new Shape();
			shape.graphics.beginFill(0xDFDFDF);
			shape.graphics.drawRect(8, 0, 8, 8);
			shape.graphics.drawRect(0, 8, 8, 8);
			shape.graphics.endFill();
			var data : BitmapData = new BitmapData(16, 16, false, 0xFFFFFF);
			data.draw(shape);
			return data;
		}
	}
}
