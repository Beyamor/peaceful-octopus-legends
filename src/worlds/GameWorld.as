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
		private var player:Player;
		private var hud:PlayerHud;
		private var playerData:PlayerData;
		
		public function GameWorld(playerData:PlayerData=null) 
		{							
			if (playerData == null) playerData = new PlayerData();
			this.playerData = playerData;
			hud = new PlayerHud(playerData);
			add(hud);
			player = new Player(playerData);
			add(player);
			
			add(new Coin(100, 150));
			add(new Coin(200, 150));
			add(new Coin(300, 150));
			add(new ChaseMonster(200, 50, player));
			
			var grid:Grid = Grid.fromPixels(Main.GAME_WIDTH, Main.GAME_HEIGHT, TextEntity.pixelSizeOf(TextEntity.REGULAR));
			grid.forEach(function(x:int, y:int):void {
				
				var realPos:Point = grid.scaledFromGrid(new Point(x, y));
				add(new Floor(realPos.x, realPos.y));
			});
			
			Input.define("killPlayer", 	Key.ENTER);
			Input.define("inventory", Key.E);
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
			
			if (Input.pressed("inventory")) {
				
				InventoryWorld.open(playerData, this);
			}
		}
	}

}