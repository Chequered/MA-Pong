package gameobjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	//The base class for all the gameobject (or entities) in the game
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class GameObject extends Sprite
	{
		protected var sprite : MovieClip;
		protected var velocity : Vector2D;
		protected var collisionTargets : Vector.<MovieClip>;
		
		public function GameObject(_sprite:MovieClip = null, _startVelocity:Vector2D = null):void
		{
			this.sprite = _sprite;
			this.velocity = _startVelocity;
			addChild(sprite);
			
			init();
		}
		
		private function init():void
		{
			collisionTargets = new Vector.<MovieClip>();
		}
		
		public function update():void
		{
			
		}
		
		public function testCollision():void
		{
			for (var i:int = 0; i < collisionTargets; i++)
			{
				if (this.sprite.hitTestObject(collisionTargets[i]))
				{
					// collision logic
				}
			}
		}
		
		public function addCollisionTarget(target:MovieClip):void
		{
			this.collisionTargets.push(target);
		}
	}

}