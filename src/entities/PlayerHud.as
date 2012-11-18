package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import stuff.PlayerData;
	import stuff.Colors;
	import stuff.Depths;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerHud extends Entity
	{
		private var data:PlayerData;
		
		private const FONT_SIZE:int  = 32;
		
		private var text:Text;
		
		public function PlayerHud(data:PlayerData) 
		{
			this.data = data;
			text = new Text("000", 500, 440, FONT_SIZE * 3, FONT_SIZE);
			text.color = Colors.COIN;
			text.font = Main.GAME_FONT;
			text.size = FONT_SIZE;
			graphic = text;
			
			layer = Depths.HUD;
		}
		
		override public function update():void 
		{
			super.update();
			
			text.text = data.numberOfCoins().toString();
			while (text.text.length < 3) { text.text = "0" + text.text;} // whatever
		}
	}

}