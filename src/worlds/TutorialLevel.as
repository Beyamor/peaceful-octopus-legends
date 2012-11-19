package worlds 
{
	import stuff.PlayerData;
	import net.flashpunk.FP;
	import entities.Coin;
	import entities.ChaseMonster;
	/**
	 * ...
	 * @author beyamor
	 */
	public class TutorialLevel extends GameWorld 
	{
		
		public function TutorialLevel(playerData:PlayerData=null)
		{
			add(new Coin(300, 150));
			add(new ChaseMonster(200, 50, player));
		}
		
		override protected function onPlayerDeath():void 
		{
			super.onPlayerDeath();
			
			FP.world = new TutorialLevel(playerData);
		}
	}

}