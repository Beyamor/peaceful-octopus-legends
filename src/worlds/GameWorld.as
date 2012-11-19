package worlds 
{
	import entities.ChaseMonster;
	import entities.Floor;
	import entities.Monster;
	import entities.Player;
	import entities.PlayerHud;
	import flash.geom.Point;
	import net.flashpunk.World;
	import stuff.PlayerData;
	import util.Grid;
	import util.Timer;
	import stuff.Tile;
	import entities.Coin;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import entities.TextEntity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		protected var player:Player;
		protected var hud:PlayerHud;
		protected var playerData:PlayerData;
		
		public function GameWorld(playerData:PlayerData=null) 
		{
			Input.define("killPlayer", 	Key.ENTER);
			Input.define("inventory", Key.E);
			
			if (playerData == null) playerData = new PlayerData();
			this.playerData = playerData;
			hud = new PlayerHud(playerData);
			add(hud);
			player = new Player(playerData);
			add(player);
			
			var grid:Grid = Grid.fromPixels(Main.GAME_WIDTH + 100, Main.GAME_HEIGHT + 100, TextEntity.pixelSizeOf(TextEntity.REGULAR));
			grid.forEach(function(x:int, y:int):void {
				
				var realPos:Point = grid.scaledFromGrid(new Point(x, y));
				add(new Floor(realPos.x, realPos.y));
			});
		}
		
		override public function update():void
		{
			super.update();
			
			if (playerData.isDead())
			{
				onPlayerDeath();
			}
			
			if (Input.pressed("killPlayer")) {
				
				playerData.kill();
			}
			
			if (Input.pressed("inventory")) {
				
				InventoryWorld.open(playerData, this);
			}
		}
		
		protected function onPlayerDeath():void
		{
			playerData.startNewLife();
		}
	}

}