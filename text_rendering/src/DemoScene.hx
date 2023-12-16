package;

import blueprint.Scene;
import blueprint.text.Text;
import bindings.Glfw;

class DemoScene extends Scene {
	var text:Text;

	public function new() {
		super();

		Sys.println(
			"[Q/E] - Change alignment\n" +
			"[WASD] - Change anchor"
		);
		
		text = new Text(320, 240, "assets/fonts/aller.ttf", 32, "Woah, I'm testing!\nThis is cool!");
		text.anchor.set(0.0);
		add(text);
	}

	override function keyDown(keyCode:Int, scanCode:Int, mods:Int) {
		switch (keyCode) {
			case Glfw.KEY_Q:
				// yes. this actually works.
				// but its typically better that you do `text.alignment = TextAliignment.LEFT`.
				text.alignment = (text.alignment - 1 + 3) % 3;
			case Glfw.KEY_E:
				text.alignment = (text.alignment + 1) % 3;
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
