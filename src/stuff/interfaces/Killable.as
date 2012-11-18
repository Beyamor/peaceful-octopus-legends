package stuff.interfaces 
{
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface Killable 
	{
		function isDead():Boolean;
		function takeDamage(damage:Number):void;
	}
	
}