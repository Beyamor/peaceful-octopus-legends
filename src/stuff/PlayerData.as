package stuff 
{
	import stuff.interfaces.Killable;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerData implements Killable
	{
		private var coins:int;
		private var totalHearts:int;
		private var hearts:Number;
		public var gun:Gun;
		
		public function PlayerData() 
		{
			this.gun = new Gun();
			coins = 0;
			totalHearts = 10;
			startNewLife();
		}
		
		public function addCoin():void
		{
			++coins;
		}
		
		public function numberOfCoins():int
		{
			return coins;
		}
		
		public function numberOfHearts():int
		{
			return Math.ceil(hearts) as int;
		}
		
		public function startNewLife():void
		{
			hearts = totalHearts;
		}
		
		public function isDead():Boolean
		{
			return hearts <= 0;
		}
		
		public function kill():void
		{
			hearts = 0;
		}
		
		public function takeDamage(damage:Number):void
		{
			hearts -= damage;
		}
	}

}