package worlds 
{
	import entities.Player;
	import net.flashpunk.World;
	import util.Grid;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var grid:Grid;
		private var tileWidth:Number = 48;
		
		public function GameWorld(gameWidth:Number, gameHeight:Number) 
		{
			grid = Grid.fromPixels(gameWidth, gameHeight, tileWidth);
			
			add(new Player(grid));
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}