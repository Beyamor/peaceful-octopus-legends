package stuff 
{
	import entities.Bullet;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import util.Timer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Gun 
	{
		private var shotTimer:Timer;
		
		private var spread:int;
		
		private var fireRate:Number = 1;
		
		public function Gun()
		{
			shotTimer = new Timer(fireRate);
			spread = 1;
		}
		
		public function shoot(world:World, x:Number, y:Number, direction:Number):void
		{
			if (!shotTimer.hasFired()) return;
			shotTimer.reset();
			
			var theta:Number = Math.PI / 8;
			var offsetDirection:Number = (((spread as Number) - 1) / 2) * theta;
			for (var bullet:int = 0; bullet < spread; ++bullet)
			{
				world.add(new Bullet(x, y, 3, direction - offsetDirection + bullet * theta));
			}
		}
		
		public function update():void
		{
			shotTimer.update();
		}
		
		public function increaseSpread():void
		{
			++spread;
		}
		
		public function increaseFireRate():void
		{
			fireRate *= 0.85;
		}
	}

}