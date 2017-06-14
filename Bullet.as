package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class Bullet extends MovieClip {

		var bLocation: Vector2;
		var bVelocity: Vector2;

		public function Bullet(player) {
			// constructor code
			
			bVelocity = new Vector2(0, -10);
			bLocation = new Vector2(player.x,player.y);

		}

		public function Update() {

			bLocation.add(bVelocity);
			this.x = bLocation.x;
			this.y = bLocation.y;

		}
	}
}