package;

import blueprint.Scene;
import blueprint.text.Text;
import bindings.Glfw;
import blueprint.Game;

class DemoScene extends Scene {
	var text:Text;

	public function new() {
		super();
		Game.window.clearColor = Game.window.clearColor.set(0.5);		

		Sys.println(
			"[Q/E] - Change alignment\n" +
			"[WASD] - Change anchor"
		);

		Text.textQuality = 4;
		//text = new Text(320, 240, "assets/fonts/aller.ttf", 6, "Woah, I'm testing!\nThis is cool!");
		text = new Text(320, 240, "assets/fonts/aller.ttf", 24, "Hello World?\nThat's way too basic! >:(");
		text.smoothing = true;
		text.outline = 6;
		text.anchor.set(0.0);
		add(text);
	}

	override function keyDown(keyCode:Int, scanCode:Int, mods:Int) {
		switch (keyCode) {
			case Glfw.KEY_Q:
				text.alignment = switch(text.alignment) {
					case Left: Right;
					case Center: Left;
					default: Center;
				}
				// nope. this no longer works.
				// text.alignment = (text.alignment - 1 + 3) % 3;
			case Glfw.KEY_E:
				text.alignment = switch(text.alignment) {
					case Left: Center;
					case Center: Right;
					default: Left;
				}
			case Glfw.KEY_D:
				text.anchor.x = (text.anchor.x - 0.5 + 1.5) % 1.5;
			case Glfw.KEY_A:
				text.anchor.x = (text.anchor.x + 0.5) % 1.5;
			case Glfw.KEY_S:
				text.anchor.y = (text.anchor.y - 0.5 + 1.5) % 1.5;
			case Glfw.KEY_W:
				text.anchor.y = (text.anchor.y + 0.5) % 1.5;
		}
	}
}
