package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Player extends Entity
	{
		[Embed(source = "../res/images/player.png")]
		private const SPRITE:Class;
		
		public function Player()
		{
			graphic = new Image(SPRITE);
		}
	}

}