package entities 
{
	import stuff.Colors;
	import stuff.Depths;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Floor extends TextEntity 
	{
		
		public function Floor(x:Number, y:Number) 
		{
			super("0", Colors.FLOOR);
			layer = Depths.FLOOR;
			
			this.x = x;
			this.y = y;
		}
		
	}

}