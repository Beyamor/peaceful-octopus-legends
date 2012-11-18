package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import entities.TextEntity;
	import stuff.Depths;
	import stuff.Colors;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Bullet extends TextEntity
	{
		private var xVel:Number, yVel:Number;
		
		public function Bullet(x:Number, y:Number, speed:Number, direction:Number)
		{
			super("V", Colors.BULLET, TextEntity.SMALL, direction - Math.PI / 2);
			
			this.x = x;
			this.y = y;
			
			xVel = speed * Math.cos(direction);
			yVel = speed * Math.sin(direction);
			
			layer = Depths.BULLET;
		}
		
		public override function update():void
		{
			super.update();
			
			this.x += xVel;
			this.y += yVel;
			
			var monster:Monster = collide("monster", x, y) as Monster;
			
			if (monster) hitMonster(monster);
		}
		
		private function hitMonster(monster:Monster):void
		{
			monster.takeDamage(1);
			world.remove(this);
		}
	}

}