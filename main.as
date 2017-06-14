package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;

	public class main extends MovieClip {

		var bullets: Array = new Array();

		var ball: Ball = new Ball(stage);
		var player: Player = new Player(stage);
		

		public function main() {
			// constructor co

			stage.addChild(player);
			stage.addChild(ball);
		//ztage.addEventListener(Event.ENTER_FRAME, hitTest);
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, player.keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fireDownHandler);

		}

		function update(e: Event) {

			ball.update();
			for each(var a: Bullet in bullets) {
				a.Update();
			}

		}
		
				function  collisionDetection (e:Event):void{
			
			if (player.hitTestObject(ball))
			{
				trace("boi");
				}
		}

		public function fireDownHandler(event: KeyboardEvent) {
			//keyCode 32 = SPACE
			if (event.keyCode == 32) {
				fire();
			}
		}

		public function fire() {
			
			var b: Bullet = new Bullet(player);
			b.x = player.x;
			b.y = player.y;
			b.rotation = player.rotation;
			stage.addChild(b);
			bullets.push(b);

		}
		
		
		/*function hitTest(evt: Event) {
			if (ball.hitTestObject(b)) {
				trace("hit");
			}
		}*/

	}
}