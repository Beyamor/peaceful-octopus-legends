package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine
	{
		
		private const	GAME_WIDTH:Number	= 600,
						GAME_HEIGHT:Number	= 480;
		
		public function Main():void 
		{			
			FP.world = new GameWorld(GAME_WIDTH, GAME_HEIGHT);
			super(GAME_WIDTH, GAME_HEIGHT);
		}
	}
}