package gameobjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	
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
		protected var stageRef:Stage;
		
		public function GameObject(_sprite:MovieClip = null):void
		{
			this.sprite = _sprite;
			this.velocity = new Vector2D();
			addChild(sprite);
			
			init();
		}
		
		private function init():void
		{
			collisionTargets = new Vector.<MovieClip>();
		}
		
		public function update():void
		{
			testCollision();
		}
		
		public function testCollision():void
		{
			for (var i:int = 0; i < collisionTargets.length; i++)
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