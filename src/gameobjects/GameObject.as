package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import Vector2;
	
	//The base class for all the gameobject (or entities) in the game
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class GameObject
	{
		private var sprite : MovieClip;
		private var velocity : Vector2;
		
		public function GameObject(_sprite:MovieClip, startVelocity:Vector2) 
		{
			this.sprite = _sprite;
			this.velocity = startVelocity;
		}
		
		public function update():void
		{
			
		}		
	}

}