package states.stages;

import objects.Character;
import openfl.display.BlendMode;

class Forest extends BaseStage
{
	var riv:BGSprite;
	override function create()
	{
		var sky:BGSprite = new BGSprite('forest/sky', -200, -100, 0.3, 0.3);
		sky.setGraphicSize(Std.int(sky.width * 1.2));
		sky.updateHitbox();
		add(sky);

		var undermount:BGSprite = new BGSprite('forest/undermount', -200, 20, 0.7, 0.7);
		undermount.setGraphicSize(Std.int(undermount.width * 1));
		undermount.updateHitbox();
		add(undermount);

		riv = new BGSprite('forest/riv', -200, 20, 0.9, 0.9, ['riv'],true,6);
		add(riv);
		undermount.setGraphicSize(Std.int(riv.width * 1.1));
		riv.updateHitbox();

		var floor:BGSprite = new BGSprite('forest/floor', -200, -100, 1, 1);
		floor.setGraphicSize(Std.int(floor.width * 1.25));
		floor.updateHitbox();
		add(floor);
	}

	override function createPost() {
		var floorshadingreal:BGSprite = new BGSprite('forest/blendoverray', -200, -100, 1, 1);
		floorshadingreal.setGraphicSize(Std.int(floorshadingreal.width * 1.25));
		floorshadingreal.updateHitbox();
		add(floorshadingreal);
		floorshadingreal.alpha = 0.2;
		floorshadingreal.blend = BlendMode.ADD;
	}
}