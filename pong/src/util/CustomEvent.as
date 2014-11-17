package util
{
	import flash.events.Event;
	import gameobjects.GameObject;
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class CustomEvent extends Event 
	{
		protected var object:GameObject;
		public function CustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, _object:GameObject = null):void 
		{
			super(type, bubbles, cancelable);
			this.object = _object;
		}
		
		public function getObject():GameObject
		{
			return object;
		}
		
	}

}