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
			
			coinText = new Text(prepareValue(data.numberOfCoins()), Main.GAME_WIDTH - FONT_SIZE * 3 - 10, Main.GAME_HEIGHT - FONT_SIZE - 10, FONT_SIZE * 3, FONT_SIZE);
			coinText.color = Colors.COIN;
			coinText.font = Main.GAME_FONT;
			coinText.size = FONT_SIZE;
			graphics.add(coinText);
			
			heartText = new Text(prepareValue(data.numberOfHearts()), 10, Main.GAME_HEIGHT - FONT_SIZE - 10, FONT_SIZE * 3, FONT_SIZE);
			heartText.color = Colors.HEART;
			heartText.font = Main.GAME_FONT;
			heartText.size = FONT_SIZE;
			graphics.add(heartText);
			
			layer = Depths.HUD;
		}
		
		private function prepareValue(value:int):String
		{
			var text:String = value.toString();
			while (text.length < 3) { text = "0" + text; }
			return text;
		}
		
		override public function update():void 
		{
			super.update();
			
			coinText.text = prepareValue(data.numberOfCoins());
			heartText.text = prepareValue(data.numberOfHearts());
		}
	}

}