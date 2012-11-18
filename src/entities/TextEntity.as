package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class TextEntity extends Entity 
	{
		public static const REGULAR:String	= "regular",
							SMALL:String	= "small";
		
		public function TextEntity(char:String, color:uint = 0xFFFFFF, size:String = null, angleInRadians:Number = 0)
		{
			graphic = forChar(char, color, size, angleInRadians);
			width = pixelSizeOf(size);
			height = pixelSizeOf(size);
		}
		
		public static function forChar(char:String, color:uint = 0xFFFFFF, size:String = null, angleInRadians:Number = 0) : Text {
			
			if (size == null) size = REGULAR;
			
			var text:Text = new Text(char, 0, 0, 48, 48);
			text.size = pixelSizeOf(size);
			text.font = Main.GAME_FONT;
			text.color = color;
			text.angle = angleInRadians * FP.DEG;
			
			return text;
		}
		
		public static function pixelSizeOf(size:String):int
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