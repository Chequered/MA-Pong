package gameobjects
{
	//imports
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rob Verhoef
	 */
	public class Bat1 extends GameObject
	{	
		public function Bat1(_sprite:MovieClip = null) 
		{
			super(_sprite);
		
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Controls);
			this.y = stage.stageHeight/2;
			this.x = stage.stageWidth/8 * 7 ;
		}
		
		public override function update():void
		{
			addEventListener(KeyboardEvent.KEY_DOWN, Controls);
		}
		
		public function Controls(e:KeyboardEvent):void
		{
			//the bats move when the players press their respective buttons 
			
			//up
			if (e.keyCode == 38 && this.y > 0 + this.height/2)
			{
				this.y -= 10;
			}
			
			//down 
			if (e.keyCode == 40 && this.y < stage.stageHeight - this.height/2)
			{
				this.y += 10;
			}
			
		}
		
	}

}