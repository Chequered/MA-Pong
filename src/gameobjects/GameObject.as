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
		protected var collisionTargets : Vector.<GameObject>;
		protected var stageRef:Stage;
		protected var tag:String = "object";
		
		public function GameObject(_sprite:MovieClip = null):void
		{
			this.sprite = _sprite;
			this.velocity = new Vector2D();
			addChild(sprite);
			
			init();
		}
		
		private function init():void
		{
			collisionTargets = new Vector.<GameObject>();
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
					collide(collisionTargets[i].getObjectTag(), new Vector2D(collisionTargets[i].x, collisionTargets[i].y));
				}
			}
		}
		
		public function addCollisionTarget(target:GameObject):void
		{
			this.collisionTargets.push(target);
		}
		
		public function setObjectTag(_tag:String):void
		{
			this.tag = _tag;
		}
		
		public function getObjectTag():String
		{
			return this.tag;
		}
		
		public function collide(_tag:String, _pos:Vector2D):void
		{
			
		}
		
	}

}