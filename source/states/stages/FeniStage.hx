package states.stages;

import objects.Character;
import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;


class FeniStage extends BaseStage
{
	override function create()
	{
		var fenibg = new FlxBackdrop(Paths.image('FeniStage/feni'));
		add(fenibg);
		fenibg.velocity.set(100, 100);
		fenibg.scale.set(0.85,0.85);

		var rainbow:BGSprite = new BGSprite('FeniStage/rainbow', -300, -200, 1, 1);
		rainbow.setGraphicSize(Std.int(rainbow.width * 2.5));
		rainbow.updateHitbox();
		add(rainbow);
		rainbow.alpha = 0.3;
		//ligten maybe good
		rainbow.blend = BlendMode.SCREEN;
	}
}