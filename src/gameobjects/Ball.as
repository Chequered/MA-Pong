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
			this.velocity.x = 5;
			this.velocity.y = 5;
		}
		
		public override function update():void
		{
			super.update();
			this.x += velocity.x;
			this.y += velocity.y;
			if (this.bounceCooldownTime <= 0)
			{
				if (this.x >= 800)
				{
					hitBat();
				}
				if (this.x <= 0)
				{
					hitBat();
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
		
		public function hitBat():void
		{
			this.velocity.x *= -1;
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
		}
		
		public function hitBound():void
		{
			this.velocity.y *= -1;
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
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