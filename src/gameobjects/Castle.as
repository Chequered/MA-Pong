package gameobjects
{
	import flash.display.MovieClip;
	import util.CustomEvent;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Castle extends GameObject
	{
		public static const CASTLE_DESTRUCT:String = "castle_destruct";
		
		private var hitPoints:uint = 5;
		
		public function Castle(_sprite:MovieClip = null) 
		{
			super(_sprite);
		}
		
		public override function getHitPoints():uint
		{
			return hitPoints;
		}
		
		public function attackWithBall():void
		{
			this.hitPoints -= 1;
			if (this.hitPoints <= 0)
			{
				destroy(this);
			}
		}
		
		public override function onCollision(_object:GameObject):void
		{
			if (_object.getObjectTag() == "ball")
			{
				attackWithBall();
				destroy(_object);
			}
		}
		
	}

}