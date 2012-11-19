package entities 
{
	import net.flashpunk.World;
	import stuff.Characters;
	import stuff.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Portal extends TextEntity 
	{
		private var nextRoom:World;
		
		public function Portal(x:Number, y:Number, nextRoom:World)
		{
			super(Characters.PORTAL, Colors.PORTAL);
		
			this.x = x;
			this.y = y;
			this.nextRoom = nextRoom;
			type = "portal";
		}
		
		override public function update():void 
		{
			super.update();
			
			var player:Player = collide("player", x, y) as Player;
			
			if (player)
			{
				FP.world = nextRoom;
			}
		}
		
	}

}