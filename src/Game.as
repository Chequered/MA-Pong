package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import gameobjects.Ball;
	import gameobjects.Bat
	import gameobjects.GameObject;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Game extends Sprite
	{
		static public var isRunning:Boolean;
		
		private var gameObjects:Vector.<GameObject> = new Vector.<GameObject>();
		
		public function Game() 
		{
			startGame();
		}
		
		private function startGame():void
		{
			//remove all the gameObjects in the stagew
			gameObjects.length = 0;
			
			//to create an gameobject follow these steps:
			//instantiate the object with it's corresponding sprite
			//add the object to the array
			//give it a tag, this is used for collision
			//add any objects you want to check it for collision to its collision lost
			//add the object to the stage
			
			var bat:Bat = new Bat(new ART_PLACEHOLDER_BAT());
			gameObjects.push(bat);
			bat.setObjectTag("bat");
			addChild(bat);
			
			var ball:Ball = new Ball(new ART_PLACEHOLDER_Ball());
			gameObjects.push(ball);
			ball.setObjectTag("ball");
			ball.addCollisionTarget(bat);
			addChild(ball);
			ball.x = 200;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			for (var i:int = 0; i < gameObjects.length; i++)
			{
				gameObjects[i].update();
			}
		}
		
	}

}