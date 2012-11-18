package stuff 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameText 
	{
		public static const REGULAR:String	= "regular",
							SMALL:String	= "small";
		
		public static function forChar(char:String, color:uint = 0xFFFFFF, size:String = null, angleInRadians:Number = 0) : Text {
			
			if (size == null) size = REGULAR;
			
			var text:Text = new Text(char, 0, 0, 48, 48);
			text.size = fontSizeForSize(size);
			text.font = "starForce";
			text.centerOrigin();
			text.color = color;
			text.angle = angleInRadians * FP.DEG;
			
			return text;
		}
		
		private static function fontSizeForSize(size:String):int
		{
			switch(size) {
				case SMALL:
					return 16;
				case REGULAR:
				default:
					return 48;
			}
		}
		
	}

}