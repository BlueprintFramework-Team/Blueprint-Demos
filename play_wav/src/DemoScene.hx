package;

import blueprint.Game;
import blueprint.Scene;
import blueprint.sound.SoundPlayer;

class DemoScene extends Scene {
	var song:SoundPlayer;

	public function new() {
		super();

		song = new SoundPlayer('assets/music/sneaky.wav', false, false, 0.5);
		song.play(); // The second parameter can also play automatically if set to true, but this is how you manually start/resume it.

		song.finished.add(function(sound) {
			// The parameter is what sound player just finished.
			// If you don't want to use a signal, you can also use `sound.complete`!

			Game.queueClose();
		});
	}
}
