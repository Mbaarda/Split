package {

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;



	public class Player extends MovieClip {

		var moveSpeed: uint = 6;
		var location = new Vector2;
		var moveLeft: Boolean = false;
		var moveRight: Boolean = false;
		
		public function Player(stage) {
			// constructor code
			x = 465;
			y = 685;

			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		public function Init(e: Event){
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		public function update(event: Event): void {
			//Move up, down, left, or right
			if (moveLeft && !moveRight) {
				this.x -= moveSpeed;
				this.rotationY = 180;
			}
			if (moveRight && !moveLeft) {
				this.x += moveSpeed;
				this.rotationY = 0;
			}
			//Border Collision
			if (this.x <= 0) {
				moveLeft = false;
				this.x = 0;
			}
			if (this.x >= 1000) {
				moveRight = false;
				this.x = 1000;
			}
		}

		public function keyDownHandler(event: KeyboardEvent): void {
			//keyCode 37 = LEFT
			//keyCode 65 = "a"
			if (event.keyCode == 65) {
				moveLeft = true;
			}
			//keyCode 39 = RIGHT
			if (event.keyCode == 68) {
				moveRight = true;
			}
		}


		public function keyUpHandler(event: KeyboardEvent): void {
			//keyCode 37 = LEFT
			//keyCode 65 = "a"
			if (event.keyCode == 65) {
				moveLeft = false;
			}
			//keyCode 39 = RIGHT
			//keyCode 68 = "d"
			if (event.keyCode == 68) {
				moveRight = false;
			}
		}
	}
}