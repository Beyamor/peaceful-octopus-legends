package worlds 
{
	import entities.Player;
	import entities.PlayerHud;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import punk.ui.PunkButton;
	import stuff.PlayerData;
	import net.flashpunk.utils.Input;
	import stuff.PurchaseSystem;
	/**
	 * ...
	 * @author beyamor
	 */
	public class InventoryWorld extends World
	{
		private var previousWorld:World;
		private var player:PlayerData;
		private var purchaseSystem:PurchaseSystem;
		
		private const BUTTON_WIDTH:Number	= 100;
		private const BUTTON_HEIGHT:Number	= 20;
		private const MARGIN:Number			= 20;
		
		private var closing:Boolean = false;
		
		public static function open(player:PlayerData, previousWorld:GameWorld):void
		{
			FP.world = new InventoryWorld(player, previousWorld);
		}
		
		public function InventoryWorld(player:PlayerData, previousWorld:World)
		{
			trace("i am a new inventory");
			this.player = player;
			this.previousWorld = previousWorld;
			this.purchaseSystem = new PurchaseSystem(player);
			
			add(new PunkButton(
				MARGIN,
				MARGIN,
				BUTTON_WIDTH,
				BUTTON_HEIGHT,
				"Spread",
				function():void { purchaseSystem.purchase(PurchaseSystem.GUN_SPREAD); } ));
			
			addCloseButton();
			
			add(new PlayerHud(player));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed("inventory")) close();
			
			// the fuck are these hacks
			if (closing)
			{
				// but actually, you can't removeAll while handling button input
				// shit breaks mad
				removeAll();
				FP.world = previousWorld;
			}
		}
		
		private function addCloseButton():void
		{			
			add(new PunkButton(
				Main.GAME_WIDTH - BUTTON_WIDTH - MARGIN,
				MARGIN,
				BUTTON_WIDTH,
				BUTTON_HEIGHT,
				"Close",
				function():void { trace("wut"); close(); } ));
		}
		
		private function close():void
		{
			closing = true;
		}
	}

}