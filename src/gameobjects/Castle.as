package gameobjects
{
	import flash.display.MovieClip;
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
		
		public function getHitPoints():uint
		{
			return hitPoints;
		}
		
		public function attackWithBall():void
		{
			this.hitPoints -= 1;
			if (this.hitPoints <= 0)
			{
			}
		}
		
		public override function onCollision(_object:GameObject):void
		{
			if (_object.getObjectTag() == "ball")
			{
				hitPoints -= 1;
				destroy(_object);
			}
		}
		
	}

}