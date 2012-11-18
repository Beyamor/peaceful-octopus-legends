package stuff 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerData 
	{
		private var coins:int;
		private var totalHitpoints:Number;
		private var hitpoints:Number;
		public var gun:Gun;
		
		public function PlayerData() 
		{
			this.gun = new Gun();
			coins = 0;
			totalHitpoints = 10;
			startNewLife();
		}
		
		public function addCoin():void
		{
			++coins;
		}
		
		public function startNewLife():void
		{
			hitpoints = totalHitpoints;
		}
		
		public function isDead():Boolean
		{
			return hitpoints <= 0;
		}
		
		public function kill():void
		{
			hitpoints = 0;
		}
	}

}