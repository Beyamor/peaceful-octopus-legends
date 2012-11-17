package worlds 
{
	import entities.Player;
	import net.flashpunk.World;
	import util.Grid;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var grid:Grid;
		private var tileWidth:Number = 48;
		private var updateTimer:Timer
		
		public function GameWorld(gameWidth:Number, gameHeight:Number) 
		{
			updateTimer = new Timer(0.5);
			grid = Grid.fromPixels(gameWidth, gameHeight, tileWidth);
			
			add(new Player(grid));
		}
		
		override public function update():void
		{
			updateTimer.update();
			
			if (updateTimer.hasFired()) {
			
				updateTimer.reset();
				super.update();
			}
		}
	}

}