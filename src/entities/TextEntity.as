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
		public static const REGULAR:String		= "regular",
							SMALL:String		= "small",
							REALLY_SMALL:String	= "reallySmall";
		
		protected var text:Text;
		
		public function TextEntity(char:String, color:uint = 0xFFFFFF, size:String = null, angleInRadians:Number = 0)
		{
			text = forChar(char, color, size, angleInRadians);
			graphic = text;
			width = pixelSizeOf(size);
			height = pixelSizeOf(size);
		}
		
		public static function forChar(char:String, color:uint = 0xFFFFFF, size:String = null, angleInRadians:Number = 0) : Text {
			
			if (size == null) size = REGULAR;
			
			var text:Text = new Text(char, 0, 0, 48 * char.length, 48);
			text.size = pixelSizeOf(size);
			text.font = Main.GAME_FONT;
			text.color = color;
			text.angle = angleInRadians * FP.DEG;
			text.x = -(text.size * text.text.length) / 2;
			text.y = -(text.size / 2);
			
			return text;
		}
		
		public static function pixelSizeOf(size:String):int
		{
			switch(size) {
				case REALLY_SMALL:
					return 8;
				case SMALL:
					return 16;
				case REGULAR:
				default:
					return 48;
			}
		}
	}

}