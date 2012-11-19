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
	import stuff.PlayerData;
	import util.Grid;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import entities.TextEntity;
	import stuff.Depths;
	import stuff.Colors;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends TextEntity
	{		
		private var data:PlayerData;
		
		public function Player(data:PlayerData)
		{
			this.data = data;
			layer = Depths.PLAYER;
			super("A", Colors.PLAYER);
			
			Input.define("left", 		Key.A);
			Input.define("right", 		Key.D);
			Input.define("up", 			Key.W);
			Input.define("down", 		Key.S);
			
			Input.define("shootLeft", 	Key.LEFT);
			Input.define("shootRight", 	Key.RIGHT);
			Input.define("shootUp", 	Key.UP);
			Input.define("shootDown", 	Key.DOWN);
			
			Input.define("addMoney",	Key.NUMPAD_ADD);
		}
		
		override public function update():void 
		{
			super.update();
			
			type = "player";
			
			data.gun.update();
			move();
			
			shoot();
			
			if (Input.check("addMoney"))
			{
				data.addCoin();
			}
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
			
			x += dx * 2;
			y += dy * 2;
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
			
			data.gun.shoot(world, x, y, Math.atan2(dy, dx));
		}
		
		public function pickUpCoin(coin:Coin):void {
			
			coin.world.remove(coin);
			data.addCoin();
		}
		
		public function takeDamage(damage:Number):void
		{
			data.takeDamage(damage);
		}
	}

}