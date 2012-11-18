package util 
{	
	import adobe.utils.ProductManager;
	import flash.geom.Point;
	import stuff.Tile;
	import Main;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Grid 
	{
		private var	width:int,
					height:int;
		private var	scale:Number;
		
		public function Grid(width:int, height:int, scale:Number = 1)
		{
			this.width = width;
			this.height = height;
			this.scale = scale;
		}
		
		public static function fromPixels(pixelWidth:Number, pixelHeight:Number, pixelsPerUnit:Number):Grid {
			
			return new Grid(Math.floor(pixelWidth / pixelsPerUnit), Math.floor(pixelHeight / pixelsPerUnit), pixelsPerUnit);
		}
		
		public function isOnGrid(pos:Point):Boolean {
			
			return pos.x >= 0 && pos.y >= 0 && pos.x < width && pos.y < height;
		}
		
		private function scaledToGrid(point:Point):Point {
			
			return new Point(point.x / scale, point.y / scale);
		}
		
		public function posOnGrid(point:Point):Point {
			
			var scaledPoint:Point = scaledToGrid(point);
			return new Point(Math.floor(scaledPoint.x), Math.floor(scaledPoint.y));
		}
		
		public function scaledFromGrid(point:Point):Point {
			
			return new Point(point.x * scale, point.y * scale);
		}
		
		public function forEach(f:Function):void
		{
			for (var x:int = 0; x < width; ++x) {
				for (var y:int = 0; y < height; ++y) {
					
					f.call(this, x, y);
				}
			}
		}
	}
}