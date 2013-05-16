package stuff 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class PurchaseSystem 
	{
		public static const GUN:String			= "gun";
		public static const GUN_SPREAD:String	= "spread";
		public static const HEARTS:String		= "heart";
		public static const FIRE_RATE:String	= "rate";
		
		private var data:PlayerData;
		
		public function PurchaseSystem(data:PlayerData)
		{
			this.data = data;
		}
		
		public function cost(what:String):int
		{
			if (what == GUN) return 2;
			
			switch (what)
			{
				case GUN:
					return 2;
					
				case FIRE_RATE:
					return 1;
					
				default:
					return 1; // TODO - Actual cost for upgrades.
			}
		}
		
		public function canAfford(what:String):Boolean
		{
			return data.numberOfCoins() >= cost(what);
		}
		
		public function purchase(what:String):void
		{
			if (!canAfford(what)) return;
			
			data.removeCoins(cost(what));
			
			switch (what)
			{
				case GUN:
					data.gun = new Gun();
					break;
					
				case GUN_SPREAD:
					data.gun.increaseSpread();
					break;
					
				case HEARTS:
					data.addHeart();
					break;
					
				case FIRE_RATE:
					data.gun.increaseFireRate();
					break;
			}
		}
	}

}