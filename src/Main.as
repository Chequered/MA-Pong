package
{
	import flash.display.Sprite;
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