package worlds 
{
	import entities.Player;
	import entities.PlayerHud;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import punk.ui.PunkButton;
	import punk.ui.skin.PunkSkin;
	import punk.ui.skins.RolpegeBlue;
	import stuff.PlayerData;
	import net.flashpunk.utils.Input;
	import stuff.PurchaseSystem;
	import ui.YoloSkin;
	import ui.SuckySuckyButton;
	
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
		
		private const SKIN:PunkSkin			= new YoloSkin();
		
		private var closing:Boolean = false,
					dirty:Boolean	= false;
		
		public static function open(player:PlayerData, previousWorld:GameWorld):void
		{
			FP.world = new InventoryWorld(player, previousWorld);
		}
		
		public function InventoryWorld(player:PlayerData, previousWorld:World)
		{
			this.player = player;
			this.previousWorld = previousWorld;
			this.purchaseSystem = new PurchaseSystem(player);
			
			refresh();
		}
		
		// fuck it
		private function refresh():void
		{
			removeAll();
			
			if (player.hasGun())
			{
				addUpgradeUI();
			}
			
			else
			{
				addNewInventoryUI();
			}
			
			addCloseButton();
			add(new PlayerHud(player));
		}
		
		private function addUpgradeUI():void
		{
			addPurchaseButton(MARGIN, MARGIN, "Hearts", PurchaseSystem.HEARTS);
			addPurchaseButton(MARGIN, MARGIN*3, "Spread", PurchaseSystem.GUN_SPREAD);
		}
		
		private function addNewInventoryUI():void
		{
			addPurchaseButton(MARGIN, MARGIN, "Gun", PurchaseSystem.GUN);
		}
		
		private function addPurchaseButton(x:Number, y:Number, text:String, what:String):void
		{
			var button:PunkButton = new SuckySuckyButton(
				x,
				y,
				BUTTON_WIDTH,
				BUTTON_HEIGHT,
				text,
				purchaseFunction(what),
				0,
				SKIN);
				
			button.active = purchaseSystem.canAfford(what);
			add(button);
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
			
			if (dirty)
			{
				refresh();
				dirty = false;
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
				close,
				0,
				SKIN));
		}
		
		private function close():void
		{
			closing = true;
		}
		
		private function purchaseFunction(what:String):Function
		{
			return function():void
			{
				purchaseSystem.purchase(what);
				dirty = true;
			}
		}
	}

}