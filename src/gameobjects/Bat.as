package gameobjects
{
	//imports
	import flash.display.MovieClip;
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
		
		public function Bat() 
		{
			trace("hallo");
			//events
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Controls);
			
			//adds the bat of player1 to the game
			player1 = new BatPlaceholder();
			player1.x = stage.stageWidth / 8;
			player1.y = stage.stageHeight / 5;
			addChild(player1);
			
			//adds the bat of player2 to the game
			player2 = new BatPlaceholder();
			player2.x = stage.stageWidth / -8;
			player2.y = stage.stageHeight / 5;
			addChild(player2);
			
		}
		
		public function Controls(e:KeyboardEvent):void
		{
			//when the up, down, w or s buttons are pressed, and the bats dont touch the top or bottom screen, the players can move their respective bats!
			
			//up
			if (e.keyCode == 38 && player1.x < stage.stageWidth)
			{
				player1.x += 1;
			}
			
			//down 
			if (e.keyCode == 40 && player1.x > 0)
			{
				player1.x -= 1;
			}
			
			//W
			if (e.keyCode == 87 && player2.x < stage.stageWidth)
			{
				player2.x += 1;
			}
			
			//S
			if (e.keyCode == 83 && player2.x > 0)
			{
				player1.x -= 1;
			}
			
		}
		
	}

}