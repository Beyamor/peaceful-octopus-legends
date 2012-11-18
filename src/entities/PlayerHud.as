package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
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
		
		private var graphics:Graphiclist;
		private var coinText:Text;
		private var heartText:Text;
		
		public function PlayerHud(data:PlayerData) 
		{
			this.data = data;
			
			graphics = new Graphiclist();
			graphic = graphics;
			
			coinText = new Text("000", Main.GAME_WIDTH - FONT_SIZE * 3 - 10, Main.GAME_HEIGHT - FONT_SIZE - 10, FONT_SIZE * 3, FONT_SIZE);
			coinText.color = Colors.COIN;
			coinText.font = Main.GAME_FONT;
			coinText.size = FONT_SIZE;
			graphics.add(coinText);
			
			heartText = new Text("000", 10, Main.GAME_HEIGHT - FONT_SIZE - 10, FONT_SIZE * 3, FONT_SIZE);
			heartText.color = Colors.HEART;
			heartText.font = Main.GAME_FONT;
			heartText.size = FONT_SIZE;
			graphics.add(heartText);
			
			layer = Depths.HUD;
		}
		
		override public function update():void 
		{
			super.update();
			
			coinText.text = data.numberOfCoins().toString();
			while (coinText.text.length < 3) { coinText.text = "0" + coinText.text; } // whatever
			
			heartText.text = data.numberOfHearts().toString();
			while (heartText.text.length < 3) { heartText.text = "0" + heartText.text;} // double whatever
		}
	}

}