package gameobjects
{
	//imports
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rob Verhoef & Daan Ruiter
	 */
	public class Bat1 extends GameObject
	{	
		
		private var direction:int = 0;
		private var castle:Castle;
		
		private var anim_Idle:MovieClip = new ART_WizardBlue_Idle();
		private var anim_up_start:MovieClip = new ART_WizardBlue_up();
		private var anim_up_stop:MovieClip = new ART_WizardBlue_up_stop();
		private var anim_down_start:MovieClip = new ART_WizardBlue_down();
		private var anim_down_stop:MovieClip = new ART_WizardBlue_down_stop();
		
		private var anim_current:MovieClip;
		
		private var animations:Array = new Array();
		
		public function Bat1(_sprite:MovieClip = null) 
		{
			super(_sprite);
			_sprite.visible = false;
			
			var platform:MovieClip;
			platform = new ART_Platform();
			platform.x = this.width / 2;
			platform.y = sprite.height - 35;
			addChild(platform);
			
			animations.push(anim_Idle);
			animations.push(anim_down_start);
			animations.push(anim_down_stop);
			animations.push(anim_up_start);
			animations.push(anim_up_stop);
			
			for (var i:int = 0; i < animations.length; i++ )
			{
				animations[i].gotoAndStop(1);
				addChild(animations[i]);
				animations[i].scaleX = 0.2;
				animations[i].scaleY = 0.2;
				
			}
			
			playAnimation(anim_Idle);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Controls);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.y = stage.stageHeight / 2;
			this.x = stage.stageWidth / 8 * 6.8;
		}
		
		public override function update():void
		{
			super.update();
			if (direction == 1)
			{
				this.y -= 10;
			}
			if (direction == 2)
			{
				this.y += 10;
			}
			if (this.y > stage.stageHeight - this.height / 2 || this.y < 0 + this.height / 2)
			{
				direction = 0;
			}
			if (anim_current != null)
			{
				if (anim_current.currentFrame >= anim_current.totalFrames - 1)
				{
					if (anim_current != anim_Idle)
					{
						anim_current.stop();
					}
					if (anim_current == anim_up_stop || anim_current == anim_down_stop)
					{
						playAnimation(anim_Idle);
					}
				}
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			//up
			if (e.keyCode == 38)
			{
				direction = 0;
				playAnimation(anim_up_stop);
			}
			
			//down 
			if (e.keyCode == 40)
			{
				direction = 0;
				playAnimation(anim_down_stop);
			}
		}
		
		public function Controls(e:KeyboardEvent):void
		{
			//the bats move when the players press their respective buttons 
			//up
			if (e.keyCode == 38 && this.y > 0 + this.height/2)
			{
				direction = 1;
				playAnimation(anim_up_start);
			}
			
			//down 
			if (e.keyCode == 40 && this.y < stage.stageHeight - this.height/2)
			{
				direction = 2;
				playAnimation(anim_down_start);
			}
		}
		
		private function playAnimation(clip:MovieClip):void
		{
			for (var i:int = 0; i < animations.length; i++ )
			{
				animations[i].gotoAndStop(1);
				animations[i].visible = false;
			}
			clip.play();
			anim_current = clip;
			anim_current.visible = true;
		}
		
	}

}