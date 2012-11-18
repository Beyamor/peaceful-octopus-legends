package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import stuff.Gun;
	import util.Grid;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import stuff.GameText;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity
	{
		[Embed(source = "../res/images/player.png")]
		private const SPRITE:Class;
		
		private var gun:Gun;
		
		public function Player()
		{
			graphic = GameText.forChar("A");
			this.gun = new Gun();
			
			Input.define("left", 	Key.A);
			Input.define("right", 	Key.D);
			Input.define("up", 		Key.W);
			Input.define("down", 	Key.S);
			
			Input.define("shootLeft", 	Key.LEFT);
			Input.define("shootRight", 	Key.RIGHT);
			Input.define("shootUp", 	Key.UP);
			Input.define("shootDown", 	Key.DOWN);
		}
		
		override public function update():void 
		{
			super.update();
			
			gun.update();
			move();
			shoot();
		}
		
		private function move():void
		{
			var	dx:Number = 0,
			dy:Number = 0;
				
			if (Input.check("left"))	dx -= 1;
			if (Input.check("right"))	dx += 1;
			if (Input.check("up"))		dy -= 1;
			if (Input.check("down"))	dy += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			x += dx;
			y += dy;
		}
		
		private function shoot():void
		{
			var	dx:Number = 0,
				dy:Number = 0;
				
			if (Input.check("shootLeft"))	dx -= 1;
			if (Input.check("shootRight"))	dx += 1;
			if (Input.check("shootUp"))		dy -= 1;
			if (Input.check("shootDown"))	dy += 1;
			
			if (dx == 0 && dy == 0) return;
			
			gun.shoot(world, x, y, Math.atan2(dy, dx));
		}
	}

}