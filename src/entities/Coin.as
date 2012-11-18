package entities 
{
	import net.flashpunk.Entity;
	import entities.TextEntity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Coin extends TextEntity
	{
		
		public function Coin(x:Number, y:Number)
		{
			super("\"", 0xFFF71C, TextEntity.SMALL);
			this.x = x;
			this.y = y;
		}
		
	}

}