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
		
		public function Gun()
		{
			var magicNumber:Number = 0.2;
			shotTimer = new Timer(magicNumber);
		}
		
		public function shoot(world:World, x:Number, y:Number, direction:Number):void
		{
			if (!shotTimer.hasFired()) return;
			shotTimer.reset();
			
			world.add(new Bullet(x, y, 3, direction));			
		}
		
		public function update():void
		{
			shotTimer.update();
		}
	}

}