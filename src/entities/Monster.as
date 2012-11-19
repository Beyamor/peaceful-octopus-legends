package entities 
{
	import stuff.Colors;
	import stuff.Depths;
	import util.Timer;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Monster extends TextEntity
	{
		private var hitTimer:Timer;
		private var stillAlive:Boolean;
		
		public function Monster(x:Number, y:Number, text:String, color:uint) 
		{			
			super(text, color);
			
			this.x = x;
			this.y = y;
			type = "monster";
			layer = Depths.MONSTER;
			
			hitTimer = new Timer(0.5);
			stillAlive = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			hitTimer.update();
			
			if (hitTimer.hasFired())
			{
				var player:Player = collide("player", x, y) as Player;
			
				if (player) hitPlayer(player);
			}
			
			if (isDead())
			{
				die();
			}
		}
		
		private function die():void
		{
			if (world) world.remove(this);
		}
		
		private function hitPlayer(player:Player):void
		{
			player.takeDamage(1);
			hitTimer.reset();
		}
		
		public function isDead():Boolean
		{
			return !stillAlive;
		}
		
		public function takeDamage(damage:Number):void
		{
			BloodSpurt.createABunch(world, x, y);
			stillAlive = false;
		}
	}

}