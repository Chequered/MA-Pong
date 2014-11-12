package gameobjects
{
	//imports
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Bat1 extends GameObject
	{	
		
		private var direction:int = 0;
		
		public function Bat1(_sprite:MovieClip = null) 
		{
			super(_sprite);
		
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Controls);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.y = stage.stageHeight/2;
			this.x = stage.stageWidth / 8 * 7;
		}
		
		public override function update():void
		{
			super.update();
			if (direction == 1)
			{
				this.y -= 10;
			}
			if (direction == 2)
			{
				this.y += 10;
			}
			if (this.y > stage.stageHeight - this.height / 2 || this.y < 0 + this.height / 2)
			{
				direction = 0;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			//up
			if (e.keyCode == 38)
			{
				direction = 0;
			}
			
			//down 
			if (e.keyCode == 40)
			{
				direction = 0;
			}
		}
		
		public function Controls(e:KeyboardEvent):void
		{
			//the bats move when the players press their respective buttons 
			
			//up
			if (e.keyCode == 38 && this.y > 0 + this.height/2)
			{
				direction = 1;
			}
			
			//down 
			if (e.keyCode == 40 && this.y < stage.stageHeight - this.height/2)
			{
				direction = 2;
			}
			
		}
		
	}

}