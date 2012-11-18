package worlds 
{
	import entities.Player;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import punk.ui.PunkButton;
	import stuff.PlayerData;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class InventoryWorld extends World
	{
		private var previousWorld:World;
		private var player:PlayerData;
		
		private const BUTTON_WIDTH:Number	= 100;
		private const BUTTON_HEIGHT:Number	= 20;
		private const MARGIN:Number			= 20;
		
		public static function open(player:PlayerData, previousWorld:GameWorld):void
		{
			FP.world = new InventoryWorld(player, previousWorld);
		}
		
		public function InventoryWorld(player:PlayerData, previousWorld:World)
		{
			this.player = player;
			this.previousWorld = previousWorld;
			
			add(new PunkButton(
				MARGIN,
				MARGIN,
				BUTTON_WIDTH,
				BUTTON_HEIGHT,
				"Spread",
				increaseSpread));
			
			addCloseButton();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("inventory")) close();
		}
		
		private function addCloseButton():void
		{			
			add(new PunkButton(
				Main.GAME_WIDTH - BUTTON_WIDTH - MARGIN,
				Main.GAME_HEIGHT - BUTTON_HEIGHT - MARGIN,
				BUTTON_WIDTH,
				BUTTON_HEIGHT,
				"Close",
				close));
		}
		
		private function close():void
		{
			FP.world = previousWorld;
		}
		
		private function increaseSpread():void
		{
			player.gun.increaseSpread();
		}
	}

}