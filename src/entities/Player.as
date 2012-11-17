package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import util.Grid;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity
	{
		[Embed(source = "../res/images/player.png")]
		private const SPRITE:Class;
		
		public function Player()
		{
			Input.define("Left", 	Key.LEFT, 	Key.A);
			Input.define("Right", 	Key.RIGHT, 	Key.D);
			Input.define("Up", 		Key.UP, 	Key.W);
			Input.define("Down", 	Key.DOWN, 	Key.S);
			
			graphic = new Image(SPRITE);
		}
		
		override public function update():void 
		{
			super.update();
			
			var	dx:Number = 0,
				dy:Number = 0;
				
			if (Input.check("Left"))	dx -= 1;
			if (Input.check("Right"))	dx += 1;
			if (Input.check("Up"))		dy -= 1;
			if (Input.check("Down"))	dy += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			x += dx;
			y += dy;
		}
	}

}