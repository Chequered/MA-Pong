package gameobjects
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.text.FontStyle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Ball extends GameObject
	{
		private var speedToAddOnBoucne:Number = 1;
		private var maxMovementSpeed:Number   = 8;
		
		private var bounceCooldown:Number = 1.2;
		private var bounceCooldownTime:Number = 0;
		
		private var locationTextField:TextField;
		
		public function Ball(_sprite:MovieClip = null):void
		{
			super(_sprite);
			this.velocity.x = 6;
			this.velocity.y = 0;
			init();
		}
		
		private function init():void
		{
			locationTextField = new TextField();
			locationTextField.text = "(" + x + ", " + y + ")[" + this.velocity.x + ", " + this.velocity.y + "]";
			addChild(locationTextField);
			var format:TextFormat = new TextFormat();
			format.size = 18;
			locationTextField.width = 200;
			locationTextField.defaultTextFormat = format;
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
					hitSideBound();
				}
				if (this.x >= stage.stageWidth)
				{
					hitSideBound();
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
			locationTextField.text = "(" + x + ", " + y + ")[" + this.velocity.x + ", " + this.velocity.y + "]";
			locationTextField.x = sprite.x + sprite.width / 2 + 2;
			locationTextField.y = sprite.y + sprite.height / 2 + 2;
		}
		
		public function hitBat(_pos:Vector2D, _bat:GameObject):void
		{
			
			var angle :Number = this.sprite.height / 2 * ( (this.y - _bat.y) / _bat.getSprite().height / 2 );
			this.velocity.x *= -1;
			this.velocity.y = angle;
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
		}
		
		
		public function hitBound():void
		{
			this.velocity.y *= -1;
			increaseSpeed();
			this.bounceCooldownTime = bounceCooldown;
		}
		
		private function hitSideBound():void
		{
			this.velocity.x *= -1;
			this.bounceCooldownTime = bounceCooldown;
			
		}
		
		override public function collide(_tag:String, _pos:Vector2D, _object:GameObject):void
		{
			if (_tag == "bat")
			{
				if (this.bounceCooldownTime <= 0)
				{
					hitBat(_pos, _object);
					_object.startAnimation();
				}
			}
			if (_tag == "castle")
			{
				_object.onCollision(this);
			}
		}
		
		private function increaseSpeed():void
		{
			if (this.velocity.x <= maxMovementSpeed && this.velocity.y <= maxMovementSpeed || this.velocity.x >= -maxMovementSpeed && this.velocity.y >= -maxMovementSpeed)
			{
				if (this.velocity.x > 0) 
				{
					this.velocity.x += speedToAddOnBoucne;
				}else {
					this.velocity.x -= speedToAddOnBoucne;
				}
				if (this.velocity.y > 0) 
				{
					this.velocity.y += speedToAddOnBoucne;
				}else {
					this.velocity.y -= speedToAddOnBoucne;
				}
			}
		}
		
	}

}