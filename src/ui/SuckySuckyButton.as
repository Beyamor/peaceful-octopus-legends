package ui 
{
	import punk.ui.PunkButton;
	import punk.ui.skin.PunkSkin;
	/**
	 * ...
	 * @author beyamor
	 */
	public class SuckySuckyButton extends PunkButton
	{
		protected var skin:PunkSkin;
		
		/**
		 * Constructor
		 *  
		 * @param x					The x coordinate of the button
		 * @param y					The y coordinate of the button
		 * @param width				The width of the button
		 * @param height			The height of the button
		 * @param text				The text of the button's label
		 * @param onReleased		What to do when the button is clicked.
		 * @param hotkey            Hotkey the trigger the component
		 * @param skin              The skin to use when rendering the component
		 * @param active			If the button should be active
		 */		
		public function SuckySuckyButton(x:Number=0, y:Number=0, width:int=1, height:int=1, text:String="Button", onReleased:Function=null, hotkey:int=0, skin:PunkSkin = null,
								   active:Boolean=true) {
			
		   this.skin = skin;
			super(x, y, width, height, text, onReleased, hotkey, skin, active);
		}
		
		override public function render():void 
		{
			if (active)
			{
				if (skin && skin.punkButton.labelProperties.color)
				{
					label.color = skin.punkButton.labelProperties.color;
				}
			}
			
			else
			{
				if (skin && skin.punkButton.labelProperties.inactiveColor)
				{
					label.color = skin.punkButton.labelProperties.inactiveColor;
				}
			}
			
			super.render();
		}
	}

}