package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import gameobjects.Ball;
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
			
			var ball:Ball = new Ball(new ART_PLACEHOLDER_Ball());
			gameObjects.push(ball);
			addChild(ball);
			
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