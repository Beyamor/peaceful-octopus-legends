package entities 
{
	import net.flashpunk.Entity;
	import stuff.PlayerData;
	import worlds.RealLevel;
	/**
	 * ...
	 * @author beyamor
	 */
	public class TutorialMonster extends ChaseMonster 
	{
		private var playerData:PlayerData;
		
		public function TutorialMonster(x:Number, y:Number, entityToChase:Entity, playerData:PlayerData)
		{
			super(x, y, entityToChase);
			coinsToDrop = 0;
			this.playerData = playerData;
		}
		
		override protected function die():void 
		{
			createPortalToRealGame();
			super.die();
		}
		
		private function createPortalToRealGame():void
		{
			world.add(new Portal(x, y, new RealLevel(playerData)));
		}
	}

}