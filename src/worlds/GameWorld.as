package worlds 
{
	import entities.Player;
	import entities.PlayerHud;
	import net.flashpunk.World;
	import stuff.PlayerData;
	import util.Grid;
	import util.Timer;
	import stuff.Tile;
	import entities.Coin;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var player:Player;
		private var hud:PlayerHud;
		private var playerData:PlayerData;
		
		public function GameWorld(gameWidth:Number, gameHeight:Number) 
		{	
			playerData = new PlayerData();
			hud = new PlayerHud(playerData);
			add(hud);
			player = new Player(playerData);
			add(player);
			add(new Coin(100, 100));
			
			Input.define("killPlayer", 	Key.ENTER);
		}
		
		override public function update():void
		{
			super.update();
			
			if (playerData.isDead())
			{
				remove(player);
				playerData.startNewLife();
				player = new Player(playerData);
				add(player);
			}
			
			if (Input.pressed("killPlayer")) {
				
				playerData.kill();
			}
		}
	}

}