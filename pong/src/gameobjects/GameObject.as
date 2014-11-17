package gameobjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.drm.DRMVoucherDownloadContext;
	import util.CustomEvent;
	
	//The base class for all the gameobject (or entities) in the game
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class GameObject extends Sprite
	{
		public static const DESTROY_OBJECT:String = "destroy_object";
		
		protected var sprite : MovieClip;
		protected var velocity : Vector2D;
		protected var collisionTargets : Vector.<GameObject>;
		protected var stageRef:Stage;
		protected var tag:String = "object";
		protected var isAnimationPlaying:Boolean;
		
		public function GameObject(_sprite:MovieClip = null):void
		{
			this.sprite = _sprite;
			collisionTargets = new Vector.<GameObject>();
			this.velocity = new Vector2D();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(sprite);
			this.sprite.gotoAndStop(0);
		}
		
		public function update():void
		{
			testCollision();
			if (isAnimationPlaying) 
			{
				if (sprite.currentFrame >= sprite.totalFrames)
				{
					isAnimationPlaying = false;
					sprite.gotoAndStop(1);
				}
			}
		}
		
		public function testCollision():void
		{
			for (var i:int = 0; i < collisionTargets.length; i++)
			{
				if (this.sprite.hitTestObject(collisionTargets[i]))
				{
					collide(collisionTargets[i].getObjectTag(), new Vector2D(collisionTargets[i].x, collisionTargets[i].y), collisionTargets[i]);
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
		
		public function getSprite():Sprite
		{
			return sprite;
		}
		
		public function collide(_tag:String, _pos:Vector2D, _object:GameObject):void
		{
			//abstract
		}
		
		public function startAnimation()
		{
			sprite.play();
			isAnimationPlaying = true;
		}
		
		public function onCollision(_object:GameObject):void
		{
			//abstract
		}
		
		public function destroy(_object:GameObject):void
		{
			dispatchEvent(new CustomEvent(DESTROY_OBJECT, false, false, _object));
		}
		
		public function getTeam():int
		{
			//abstract
			return 0;
		}
		
		public function getHitPoints():uint
		{
			//abstract
			return 0;
		}
	}

}