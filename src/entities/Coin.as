package entities 
{
	import net.flashpunk.Entity;
	import entities.TextEntity;
	import stuff.Depths;
	import stuff.Colors;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Coin extends TextEntity
	{
		
		public function Coin(x:Number, y:Number)
		{
			super("\"", Colors.COIN, TextEntity.SMALL);
			this.x = x;
			this.y = y;
			type = "coin";
			layer = Depths.COIN;
		}
		
		override public function update():void 
		{
			super.update();
			
			checkForPickup();
		}
		
		private function checkForPickup():void {
			
			var player:Player = collide("player", x, y) as Player;
			
			if (player) {
				
				player.pickUpCoin(this);
			}
		}
	}

}