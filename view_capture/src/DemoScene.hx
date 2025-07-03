package;

import blueprint.graphics.Shader;
import blueprint.objects.Sprite;
import blueprint.objects.ViewCapture;
import blueprint.Scene;
import blueprint.Game;

class DemoScene extends Scene {
	var time:Float = 0.0;
	var screenShader:Shader;

	var viewCapture:ViewCapture;
	var sprs:Array<Sprite> = [];

	public function new() {
		super();

		screenShader = new Shader("#version 330 core
		out vec4 FragColor;
		in vec2 TexCoord;

		uniform float time;
		uniform vec4 tint;
		uniform sampler2D bitmap;

		void main() {
			vec2 uv = TexCoord;
			uv.y += sin(uv.x * 3.14 * 3.0 + time) * 0.1;
			FragColor = texture(bitmap, uv) * tint;
		}", Shader.defaultVertexSource);

		var spr = new Sprite(Game.window.width * 0.25, Game.window.height * 0.25);
		add(spr);
		sprs.push(spr);

		var spr = new Sprite(Game.window.width * 0.5, Game.window.height * 0.5);
		add(spr);
		sprs.push(spr);

		var spr = new Sprite(Game.window.width * 0.75, Game.window.height * 0.75);
		spr.rotation = 30;
		add(spr);
		sprs.push(spr);

		viewCapture = new ViewCapture();
		viewCapture.shader = screenShader;
		viewCapture.drawAfter = true;
		add(viewCapture);

		// the textures of view captures can be utilized on other sprites!
		// var drawSpr = new Sprite();
		// drawSpr.anchor.set();
		// drawSpr.texture = viewCapture.texture;
		// drawSpr.flipY = true;
		// drawSpr.shader = screenShader;
		// add(drawSpr);
	}

	override function update(elapsed:Float) {
		time += elapsed;
		sprs[0].rotation = Math.sin(time) * 15;
		sprs[1].position.x = Game.window.width * (0.5 + 0.125 * Math.sin(time));
		screenShader.setUniform("time", time);
	}
}