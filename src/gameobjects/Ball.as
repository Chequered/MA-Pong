package gameobjects
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Ball extends GameObject
	{
		private var speedToAddOnBoucne:Number = 0.55;
		private var maxMovementSpeed:Number   = 6;
		
		private var bounceCooldown:Number = 2;
		private var bounceCooldownTime:Number = 0;
		
		public function Ball(_sprite:MovieClip = null):void
		{
			super(_sprite);
			this.velocity.x = 6;
			this.velocity.y = 0;
		}
		
		public override function update():void
		{
			super.update();
			this.x += velocity.x;
			this.y += velocity.y;
			if (this.bounceCooldownTime <= 0)
			{
				if (this.x <= 0)
				{
					this.velocity.x *= -1;
				}
				if (this.x >= stage.stageWidth)
				{
					this.velocity.x *= -1;
				}
				if (this.y >= stage.stageHeight)
				{
					hitBound();
				}
				if (this.y <= 0)
				{
					hitBound();
				}
			}
			if (this.bounceCooldownTime >= 0)
			{
				this.bounceCooldownTime -= 0.1;
			}
		}
		
		public function hitBat(_pos:Vector2D, _bat:GameObject):void
		{
			
			var angle :Number = this.height / 2 * ( (this.y - _bat.y) / _bat.height / 2 );
			this.velocity.x *= -1;
			this.velocity.y = angle;
			trace(angle);
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
		}
		
		
		public function hitBound():void
		{
			this.velocity.y *= -1;
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
		}
		
		override public function collide(_tag:String, _pos:Vector2D, _object:GameObject):void
		{
			if (_tag == "bat")
			{
				if (this.bounceCooldownTime <= 0)
				{
					hitBat(_pos, _object);
				}
			}
		}
		
		private function increaseSpeed():void
		{
			if (this.velocity.x <= maxMovementSpeed && this.velocity.y <= maxMovementSpeed || this.velocity.x >= -maxMovementSpeed && this.velocity.y >= -maxMovementSpeed)
			{
				this.velocity.x += speedToAddOnBoucne;
				this.velocity.y += speedToAddOnBoucne;
			}
		}
		
	}

}