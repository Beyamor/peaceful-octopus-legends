package worlds 
{
	import entities.Player;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{
			add(new Player);
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}