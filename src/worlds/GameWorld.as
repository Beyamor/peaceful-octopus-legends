package worlds 
{
	import entities.Player;
	import net.flashpunk.World;
	import util.Grid;
	import util.Timer;
	import stuff.Tile;
	import entities.Coin;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{		
		public function GameWorld(gameWidth:Number, gameHeight:Number) 
		{			
			add(new Player());
			add(new Coin(100, 100));
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}