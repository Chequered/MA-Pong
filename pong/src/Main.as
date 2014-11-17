package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Main extends Sprite
	{
		private var _game:Game;
		private var _button:SimpleButton;
		private var _endgameScreen:MovieClip;
		
		public function Main() 
		{
			_game = new Game();
			addChild(_game);
			_game.addEventListener(Game.TEAM1_WIN, win);
			_game.addEventListener(Game.TEAM1_LOSE, lose);
		}
		
		private function lose(e:Event):void 
		{
			Game.isRunning = false;
			
			_button = new UI_Button_replay();
			
			_endgameScreen = new UI_Screen_lose();
			addChild(_endgameScreen);
			addChild(_button);
			_button.x = stage.stageWidth / 2 - _button.width / 2;
			_button.y = stage.stageHeight - 200;
			_button.addEventListener(MouseEvent.MOUSE_DOWN, restart);
		}
		
		private function win(e:Event):void 
		{
			Game.isRunning = false;
			
			_button = new UI_Button_replay();
			
			_endgameScreen = new UI_Screen_win();
			addChild(_endgameScreen);
			addChild(_button);
			_button.x = stage.stageWidth / 2 - _button.width / 2;
			_button.y = stage.stageHeight - 200;
			_button.addEventListener(MouseEvent.MOUSE_DOWN, restart);
		}
		
		private function restart(e:MouseEvent):void 
		{
			_button.removeEventListener(MouseEvent.MOUSE_DOWN, restart);
			removeChild(_button);
			removeChild(_endgameScreen);
			
			_game.restart();
		}
		
	}

}