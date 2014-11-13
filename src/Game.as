package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import util.CustomEvent;
	import gameobjects.Ball;
	import gameobjects.Bat1;
	import gameobjects.Bat2;
	import gameobjects.GameObject;
	import gameobjects.Castle;
	
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
			
			var bg:MovieClip = new ART_Background();
			addChild(bg);
			
			var bat1:Bat1 = new Bat1(new ART_PLACEHOLDER_BAT());
			addGameObject(bat1);
			bat1.setObjectTag("bat");
			bat1.addEventListener(Castle.CASTLE_DESTRUCT, descructCastle);
			addChild(bat1);
			var bat2:Bat2 = new Bat2(new ART_PLACEHOLDER_BAT());
			addGameObject(bat2);
			bat2.setObjectTag("bat");
			addChild(bat2);
			
			var ball:Ball = new Ball(new ART_PLACEHOLDER_Ball());
			addGameObject(ball);
			ball.setObjectTag("ball");
			addChild(ball);
			ball.x = 200;
			
			var castle1:Castle = new Castle(new ART_PLACEHOLDER_Castle());
			addGameObject(castle1);
			castle1.setObjectTag("castle");
			castle1.x = 0;
			castle1.y = 300;
			addChild(castle1);
			
			ball.addCollisionTarget(bat1);
			ball.addCollisionTarget(bat2);
			ball.addCollisionTarget(castle1);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function descructCastle(e:CustomEvent):void 
		{
			e.getObject().visible = false;
		}
		
		private function addGameObject(_object:GameObject):void
		{
			gameObjects.push(_object);
			_object.addEventListener(GameObject.DESTROY_OBJECT, descructCastle);
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