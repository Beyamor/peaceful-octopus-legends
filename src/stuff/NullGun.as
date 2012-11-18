package stuff 
{
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NullGun extends Gun 
	{
		
		public function NullGun() 
		{
			
		}
		
		override public function shoot(world:World, x:Number, y:Number, direction:Number):void 
		{
			// Do nothing
		}
	}

}