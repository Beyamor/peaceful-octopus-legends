package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Bullet extends Entity
	{
		private var xVel:Number, yVel:Number;
		
		public function Bullet(x:Number, y:Number, speed:Number, direction:Number)
		{
			graphic = new Text(">");
			
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