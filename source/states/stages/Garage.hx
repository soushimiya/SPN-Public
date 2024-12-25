package states.stages;

import objects.Character;
import openfl.display.BlendMode;

class Garage extends BaseStage
{
	override function create()
	{
		var bg:BGSprite = new BGSprite('garage/floor', -87, 0, 1, 1);
		bg.setGraphicSize(Std.int(bg.width * 1.05));
		bg.updateHitbox();
		add(bg);
	}

	override function createPost() {
		var bg2:BGSprite = new BGSprite('garage/spray', 340, 250, 0.8, 0.8);
		bg2.setGraphicSize(Std.int(bg2.width * 0.7));
		bg2.updateHitbox();
		add(bg2);

		var floorshadingreal:BGSprite = new BGSprite('garage/blendoverray', -75, 0, 1, 1);
		floorshadingreal.setGraphicSize(Std.int(floorshadingreal.width * 1.05));
		floorshadingreal.updateHitbox();
		add(floorshadingreal);
		floorshadingreal.alpha = 0.1;
		floorshadingreal.blend = BlendMode.ADD;
	}
}