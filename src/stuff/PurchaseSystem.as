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
		
		private var data:PlayerData;
		
		public function PurchaseSystem(data:PlayerData)
		{
			this.data = data;
		}
		
		public function cost(what:String):int
		{
			return 1; // TODO - Actual cost for upgrades.
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
			}
		}
	}

}