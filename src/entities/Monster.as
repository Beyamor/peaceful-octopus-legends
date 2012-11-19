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
		protected var coinsToDrop:int = 0;
		
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
		
		private function dropCoins():void
		{
			for (var coin:int = 0; coin < coinsToDrop; ++coin)
			{
				var xOffset:Number = -10 + Math.random() * 20;
				var yOffset:Number = -10 + Math.random() * 20;
				world.add(new Coin(x + xOffset, y + yOffset));
			}
		}
		
		protected function die():void
		{
			dropCoins();
			
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