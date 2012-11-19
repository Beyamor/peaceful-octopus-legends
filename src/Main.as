package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import net.flashpunk.graphics.Text;
	import worlds.TutorialLevel;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine
	{
		[Embed(source = 'res/fonts/starForce.ttf', embedAsCFF="false", fontFamily = 'starForce')]
		private static var font:Class;
		public static const GAME_FONT:String = "starForce";
		
		public static const	GAME_WIDTH:Number	= 600;
		public static const	GAME_HEIGHT:Number	= 480;
		
		public function Main():void 
		{
			
			FP.world = new TutorialLevel();
			super(GAME_WIDTH, GAME_HEIGHT);
		}
	}
}