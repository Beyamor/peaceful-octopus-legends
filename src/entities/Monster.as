package entities 
{
	import stuff.Colors;
	import stuff.Depths;
	import stuff.interfaces.Killable;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Monster extends TextEntity implements Killable
	{
		private var hitTimer:Timer;
		private var stillAlive:Boolean;
		
		public function Monster(x:Number, y:Number) 
		{
			super("M", Colors.MONSTER);
			
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
			stillAlive = false;
			
			if (isDead()) world.remove(this);
		}
	}

}