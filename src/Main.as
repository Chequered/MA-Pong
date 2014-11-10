package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Main extends Sprite
	{
		private var _game:Game;
		public function Main() 
		{
			_game = new Game();
			addChild(_game);
		}
		
	}

}