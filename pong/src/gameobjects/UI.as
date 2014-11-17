package gameobjects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite
	import flash.display.Stage;
<<<<<<< HEAD:pong/src/gameobjects/UI.as
=======

>>>>>>> b6c2318dc1db83fbaabb1aeb96d87c8b42ea1756:src/gameobjects/UI.as
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class UI extends GameObject
	{
		public var NoLivesP1:int = 5;
		public var NoLivesP2:int = 5;
		public var _stage:Stage;
		private var displayLivesP1:MovieClip;
		private var displayLivesP2:MovieClip;
		
		public function UI() 
		{
			for (var y1:int = 0; y1 < NoLivesP1; y1++ )
			{
				LivesP1(y1);
			}
			
			for (var y2:int = 0; y2 < No
			LivesP2; y2++ )
			{
				LivesP2(y2);
			}
			
		}
		
		private function LivesP1(y1:int):void 
		{
<<<<<<< HEAD:pong/src/gameobjects/UI.as
			displayLivesP1 = new ART_PLACEHOLDER_Ball();
			displayLivesP1.x = 600 / 8;
			displayLivesP1.y = 800 / 2 * y1;
=======

			displayLivesP1 = new ART_PLACEHOLDER_Ball();
			displayLivesP1.x = 600 / 8;
			displayLivesP1.y = 800 / 2 * y1;

			displayLivesP1 = new ART_PLACEHOLDER_Life;
			displayLivesP1.x = stage.stageHeight / 8;
			displayLivesP1.y = stage.stageWidth / 2 * y1;
>>>>>>> b6c2318dc1db83fbaabb1aeb96d87c8b42ea1756:src/gameobjects/UI.as
			addChild(displayLivesP1);
		}
		
		private function LivesP2(y2:int):void 
		{
<<<<<<< HEAD:pong/src/gameobjects/UI.as
			displayLivesP2 = new ART_PLACEHOLDER_Ball();
			displayLivesP2.x = 600 / 8;
			displayLivesP2.y = 800 / 2 * y2;
=======

			displayLivesP2 = new ART_PLACEHOLDER_Ball();
			displayLivesP2.x = 600 / 8;
			displayLivesP2.y = 800 / 2 * y2;

			displayLivesP2 = new ART_PLACEHOLDER_Life;
			displayLivesP2.x = stage.stageHeight / 8;
			displayLivesP2.y = stage.stageWidth / 2 * y2;
>>>>>>> b6c2318dc1db83fbaabb1aeb96d87c8b42ea1756:src/gameobjects/UI.as
			addChild(displayLivesP1);
		}
		
	}

}