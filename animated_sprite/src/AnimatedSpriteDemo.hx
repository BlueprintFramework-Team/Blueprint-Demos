package;

import blueprint.objects.Sprite;
import blueprint.Game;
import blueprint.Scene;
import blueprint.objects.AnimatedSprite;

class AnimatedSpriteDemo extends Scene {
	var normalSprite:Sprite;
	var animatedSprite:AnimatedSprite;

	public function new() {
		super();

        normalSprite = new Sprite(Game.window.width / 2, 0.0, 'assets/images/blueprint.png');
        normalSprite.scale.set(0.5);
        normalSprite.anchor.set(0.5, 0.0);
        add(normalSprite);

		animatedSprite = new AnimatedSprite(Game.window.width / 2, Game.window.height, 'assets/images/bluesquish.xml');
        animatedSprite.scale.set(0.5);
        animatedSprite.anchor.set(0.5, 1.0);
        animatedSprite.addPrefixAnim('squish', 'squish', 16, true);
        animatedSprite.playAnim('squish');
		add(animatedSprite);
	}
}
