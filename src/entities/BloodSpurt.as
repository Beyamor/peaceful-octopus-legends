package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.World;
	import stuff.Characters;
	import stuff.Colors;
	import util.Timer;
	/**
	 * ...
	 * @author beyamor
	 */
	public class BloodSpurt extends TextEntity
	{
		private var direction:Number;
		private var lifeTimer:Timer;
		
		private const LIFE_SPAN:Number = 0.5;
		private const SPEED:Number = 2;
		
		public function BloodSpurt(x:Number, y:Number, direction:Number)
		{
			lifeTimer = new Timer(LIFE_SPAN);
			super(Characters.BLOOD_SPURT, Colors.BLOOD, TextEntity.SMALL, direction + Math.PI / 2);
			this.x = x;
			this.y = y;
			this.direction = direction;
		}
		
		override public function update():void 
		{
			super.update();
			
			lifeTimer.update();
			
			text.alpha = (1 - lifeTimer.percentElapsed()) * 100;
			
			x += SPEED * Math.cos(direction);
			y += SPEED * Math.sin(direction);
			
			if (lifeTimer.hasFired())
			{
				world.remove(this);
			}
		}
		
		public static function createABunch(world:World, x:Number, y:Number):void
		{			
			var initialOffset:Number = Math.PI * Math.random();
			var numberToMake:Number = Math.floor(8 + Math.random() * 4);
			var theta:Number = Math.PI * 2 / numberToMake;
			
			for (var i:int = 0; i <= numberToMake; ++i)
			{
				world.add(new BloodSpurt(x, y, initialOffset + i * theta));
			}
		}
	}

}