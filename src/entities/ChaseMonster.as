package entities 
{
	import net.flashpunk.Entity;
	import stuff.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ChaseMonster extends Monster 
	{
		private var thingToChase:Entity;
		
		public function ChaseMonster(x:Number, y:Number, thingToChase:Entity)
		{
			this.thingToChase = thingToChase;
			super(x, y, "M", Colors.CHASER);
		}
		
		override public function update():void 
		{
			super.update();
			
			FP.stepTowards(this, thingToChase.x, thingToChase.y);
		}
		
	}

}