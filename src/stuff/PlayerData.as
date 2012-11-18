package stuff 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerData 
	{
		private var coins:int;
		
		public function PlayerData() 
		{
			coins = 0;
		}
		
		public function addCoin():void
		{
			++coins;
		}
	}

}