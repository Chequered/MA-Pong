package gameobjects {
	import flash.display.MovieClip;
	import flash.display.Sprite
	import flash.display.Stage;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class UI extends Sprite
	{
		public var NoOfLivesP1:int = 5;
		public var NoOfLivesP2:int = 5;
		public var _stage:Stage;
		private var displayLivesP1:MovieClip;
		private var displayLivesP2:MovieClip;
		
		public function UI() 
		{
			for (var y1:int = 0; y1 < NoOfLivesP1; y1++ )
			{
				LivesP1(y1);
			}
			
			for (var y2:int = 0; y2 < NoOfLivesP2; y2++ )
			{
				LivesP2(y2);
			}
			\
		}
		
		private function LivesP1(y1:int):void 
		{
			displayLivesP1 = new ART_PLACEHOLDER_Ball();
			displayLivesP1.x = 600 / 8;
			displayLivesP1.y = 800 / 2 * y1;
			addChild(displayLivesP1);
		}
		
		private function LivesP2(y2:int):void 
		{
			displayLivesP2 = new ART_PLACEHOLDER_Ball();
			displayLivesP2.x = 600 / 8;
			displayLivesP2.y = 800 / 2 * y2;
			addChild(displayLivesP1);
		}
		
	}

}