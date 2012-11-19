package worlds 
{
	import entities.ChaseMonster;
	import stuff.PlayerData;
	import util.Timer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class RealLevel extends GameWorld 
	{
		private const START_X:Number = Main.GAME_WIDTH / 2;
		private const START_Y:Number = Main.GAME_HEIGHT / 2;
		
		private var monsterSpawner:Timer;
		private const MIN_MONSTER_TIME:Number = 2;
		private const MAX_MONSTER_TIME:Number = 5;
		
		public function RealLevel(playerData:PlayerData) 
		{
			super(playerData);
			player.x = START_X;
			player.y = START_Y;
			resetMonsterSpawner();
		}
		
		private function resetMonsterSpawner():void
		{
			monsterSpawner = new Timer(MIN_MONSTER_TIME + Math.random() * (MAX_MONSTER_TIME - MIN_MONSTER_TIME));
		}
		
		override public function update():void 
		{
			super.update();
			
			monsterSpawner.update()
			
			if (monsterSpawner.hasFired())
			{
				resetMonsterSpawner();
				
				var x:Number = Math.random() * Main.GAME_WIDTH;
				var y:Number = Math.random() * Main.GAME_HEIGHT;
				
				add(new ChaseMonster(x, y, player));
			}
		}
		
		override protected function onPlayerDeath():void 
		{
			super.onPlayerDeath();
			player.x = START_X;
			player.y = START_Y;
		}
	}

}