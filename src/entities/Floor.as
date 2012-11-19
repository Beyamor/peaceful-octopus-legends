package entities 
{
	import stuff.Colors;
	import stuff.Depths;
	import stuff.Characters;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Floor extends TextEntity 
	{
		
		public function Floor(x:Number, y:Number) 
		{
			super(Characters.FLOOR, Colors.FLOOR);
			layer = Depths.FLOOR;
			
			this.x = x;
			this.y = y;
		}
		
	}

}