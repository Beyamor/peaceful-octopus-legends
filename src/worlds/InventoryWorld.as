package worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import punk.ui.PunkButton;
	/**
	 * ...
	 * @author beyamor
	 */
	public class InventoryWorld extends World
	{
		private var previousWorld:World;
		
		public function InventoryWorld(previousWorld:World)
		{
			this.previousWorld = previousWorld;
			
			// what's more magic than magic numbers
			add(new PunkButton(Main.GAME_WIDTH - 100 - 20, Main.GAME_HEIGHT - 20 - 20, 100, 20, "Close", close));
		}
		
		private function close():void
		{
			FP.world = previousWorld;
		}
	}

}