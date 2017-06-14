package {
	import flash.display.MovieClip;

	public class Ball extends MovieClip {

		var location: Vector2;
		var velocity: Vector2;
		var accelerate: Vector2;
		public var gravity: Vector2 = new Vector2(0,5);

		var mass: Number;

		public function Ball(stage) {
			// constructor code
			
			velocity = new Vector2(2, 2);
			location = new Vector2(100, 100);
			accelerate = new Vector2(0, 0);
			
			mass = 20;

		}

		function applyForce(force: Vector2) {

			var f: Vector2 = force.copy();
			f.divS(mass);
			accelerate.add(f);

		}
		


		function update() {

			applyForce(gravity);
			velocity.add(accelerate);
			location.add(velocity);
			accelerate.multS(0);
			border();

		}


		function border() {

			x = location.x;
			y = location.y;


			if (x > stage.stageWidth - this.width) {
				location.x = stage.stageWidth - this.width;
				velocity.x *= -1;

			}
			if (x < 0) {
				location.x = 0;
				velocity.x *= -1;
			}
			if (y > stage.stageHeight - this.height) {
				location.y = stage.stageHeight - this.height;
				velocity.y *= -1;
			}
			if (y < 0) {
				location.y = 0;
				velocity.y *= -1;
			}
		}

	}

}