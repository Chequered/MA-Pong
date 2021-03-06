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
		private var team:int;
		
<<<<<<< HEAD:pong/src/gameobjects/Castle.as
		public function Castle(_sprite:MovieClip = null, _team:int = 0 ):void 
=======
		private var explode:Explode = new Explode();
		
		public function Castle(_sprite:MovieClip = null) 
>>>>>>> b6c2318dc1db83fbaabb1aeb96d87c8b42ea1756:src/gameobjects/Castle.as
		{
			super(_sprite);
			this.team = _team;
		}
		
		public function setHitPoints(points:uint):void
		{
			this.hitPoints = points;
		}
		
		public override function getHitPoints():uint
		{
			return hitPoints;
		}
		
		public function attackWithBall():void
		{
			this.hitPoints -= 1;
			trace(hitPoints);
			if (this.hitPoints <= 0)
			{
				destroy(this);
			}
		}
		
		public function setTeam(_team:int):void
		{
			this.team = _team;
		}
		
		override public function getTeam():int
		{
			return team;
		}
		
		public override function onCollision(_object:GameObject):void
		{
			if (_object.getObjectTag() == "ball")
			{
				attackWithBall();
				explode.play();
				destroy(_object);
			}
		}
		
	}

}