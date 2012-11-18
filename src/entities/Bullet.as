package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import stuff.GameText;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Bullet extends Entity
	{
		private var xVel:Number, yVel:Number;
		
		public function Bullet(x:Number, y:Number, speed:Number, direction:Number)
		{
			graphic = GameText.forChar("V", 0xD6B73A, GameText.SMALL, direction - Math.PI/2);
			
			this.x = x;
			this.y = y;
			
			xVel = speed * Math.cos(direction);
			yVel = speed * Math.sin(direction);
		}
		
		public override function update():void
		{
			super.update();
			
			this.x += xVel;
			this.y += yVel;
		}
	}

}