package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import gameobjects.UI;
	
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
		static public var isRunning:Boolean = true;
		static public const TEAM1_LOSE:String = "team1_lose";
		static public const TEAM1_WIN:String = "team1_win";
		
		private var gameObjects:Vector.<GameObject> = new Vector.<GameObject>();
		
		private var bat1:Bat1;
		private var bat2:Bat2;
		private var castle1:Castle;
		private var castle2:Castle;
		
		private var startSound:begin_geluidje = new begin_geluidje();
		private var music:Sound = new bg_music();
		
		public function Game()
		{
			startGame();
			startSound.play();
			//playMusic();
		}
		
		private function startGame():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
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
			
			bat1 = new Bat1(new ART_PLACEHOLDER_BAT());
			addGameObject(bat1);
			bat1.setObjectTag("bat");
			addChild(bat1);
			
			bat2 = new Bat2(new ART_PLACEHOLDER_BAT());
			addGameObject(bat2);
			bat2.setObjectTag("bat");
			addChild(bat2);
			
			castle1 = new Castle(new ART_Tower_left());
			addGameObject(castle1);
			castle1.setObjectTag("castle");
			castle1.x = -40;
			castle1.y = 0;
			castle1.setTeam(1);
			addChild(castle1);
			
			castle2 = new Castle(new ART_Tower_right());
			addGameObject(castle2);
			castle2.setObjectTag("castle");
			castle2.x = 720;
			castle2.y = 0;
			castle2.setTeam(2);
			addChild(castle2);
			
<<<<<<< HEAD:pong/src/Game.as
			spawnBall();
=======
			player1HP = castle1.getHitPoints();
			player2HP = castle2.getHitPoints();
			
			//var ui:UI = new UI();
			//addChild(ui);
			
			ball.addCollisionTarget(bat1);
			ball.addCollisionTarget(bat2);
			ball.addCollisionTarget(castle1);
			
>>>>>>> b6c2318dc1db83fbaabb1aeb96d87c8b42ea1756:src/Game.as
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function destroyObject(e:CustomEvent):void 
		{
			if (e.getObject().getObjectTag() == "ball")
			{
				gameObjects.splice(gameObjects.indexOf(e.getObject()), 1);
				removeChild(e.getObject());
				spawnBall();
			}
			if (e.getObject().getObjectTag() == "castle")
			{
				if (e.getObject().getTeam() == 1)
				{
					dispatchEvent(new Event(TEAM1_LOSE));
					
				}else {
					dispatchEvent(new Event(TEAM1_WIN));
				}
			}
		}
		
		private function spawnBall():void
		{		
			var ball:Ball = new Ball(new ART_PLACEHOLDER_Ball());
			addGameObject(ball);
			ball.setObjectTag("ball");
			addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			ball.addCollisionTarget(bat1);
			ball.addCollisionTarget(bat2);
			ball.addCollisionTarget(castle1);
			ball.addCollisionTarget(castle2);
		}
		
		public function restart():void
		{
			castle1.setHitPoints(5);
			castle2.setHitPoints(5);
			isRunning = true;
			bat1.y = stage.stageHeight / 2;
			bat2.y = stage.stageHeight / 2;
		}
		
		private function addGameObject(_object:GameObject):void
		{
			gameObjects.push(_object);
			_object.addEventListener(GameObject.DESTROY_OBJECT, destroyObject);
		}
			
		
		private function update(e:Event):void
		{
			if (isRunning)
			{
				for (var i:int = 0; i < gameObjects.length; i++)
				{
					gameObjects[i].update();
				}
			}
		}
		
		//private function playMusic():void
		//{
			//var channel:SoundChannel = music.play();
			//channel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
		//}
		//
		//private function loopMusic(event:Event):void
		//{
			//SoundChannel(event.target).removeEventListener(event.type, loopMusic);
			//playMusic();
		//}
	
	}

}