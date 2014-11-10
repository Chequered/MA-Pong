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
	public class Bat extends GameObject
	{
		//vars
		public var player1:BatPlaceholder;
		public var player2:BatPlaceholder;
		
		public function Bat(_sprite:MovieClip = null) 
		{
			super(_sprite);
			//events
			
			//adds the bat of player1 to the game
			//player1 = new BatPlaceholder();
			//player1.x = stage.stageWidth / 8;
			//player1.y = stage.stageHeight / 5;
			//addChild(player1);
			
			//adds the bat of player2 to the game
			//player2 = new BatPlaceholder();
			//player2.x = stage.stageWidth / -8;
			//player2.y = stage.stageHeight / 5;
			//addChild(player2);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Controls);			
		}
		
		public override function update():void
		{
			addEventListener(KeyboardEvent.KEY_DOWN, Controls);
		}
		
		public function Controls(e:KeyboardEvent):void
		{
			//when the up, down, w or s buttons are pressed, and the bats dont touch the top or bottom screen, the players can move their respective bats!
			
			trace("controls");
			
			//up
			if (e.keyCode == 38 )
			{
				trace("up");
				this.x += 1;
			}
			
			//down 
			if (e.keyCode == 40)
			{
				this.x -= 1;
			}
			
			//W
			
		}
		
	}

}