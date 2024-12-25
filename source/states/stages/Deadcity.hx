package states.stages;

import objects.Character;
import openfl.display.BlendMode;

import hxcodec.flixel.FlxVideo as VideoHandler;

var bg5:BGSprite;
var bg5alt:BGSprite;
var bg7:BGSprite;


var video:VideoHandler;

class Deadcity extends BaseStage
{
	override function create()
	{
		var bg:BGSprite = new BGSprite('deadcity/1', -1000, -1500, 0.2, 0.2);
		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		add(bg);
		bg.alpha = 0.6;

		var bg2:BGSprite = new BGSprite('deadcity/2', -900, -1200, 0.4, 0.4);
		bg2.setGraphicSize(Std.int(bg2.width * 1.5));
		bg2.updateHitbox();
		add(bg2);
		
		var bg3:BGSprite = new BGSprite('deadcity/3', 0, -450, 0.7, 0.7);
		bg3.updateHitbox();
		add(bg3);

		var bg4:BGSprite = new BGSprite('deadcity/4', 0, 0, 1, 1);
		bg4.updateHitbox();
		add(bg4);

		if (songName == "imitate") {
			camGame.alpha = 0;
			camHUD.alpha = 0;
			video = new VideoHandler();
			video.onEndReached.add(function()
			{
				camGame.alpha = 1;
				camGame.zoom = 1.1;
				FlxTween.tween(camGame, {zoom: 0.75 }, 5 ,{ ease: FlxEase.circOut});
				FlxTween.tween(camHUD, {alpha: 1 }, 4 ,{ ease: FlxEase.circOut});
				FlxTween.tween(video, {alpha: 0 }, 3 ,{ ease: FlxEase.circOut});
			}, true);
		}
	}

	override function createPost() {
		var floorshadingreal:BGSprite = new BGSprite('deadcity/blendoverray', 0, 0, 1, 1);
		floorshadingreal.setGraphicSize(Std.int(floorshadingreal.width * 1));
		floorshadingreal.updateHitbox();
		add(floorshadingreal);
		floorshadingreal.alpha = 0.2;
		floorshadingreal.blend = BlendMode.ADD;

		bg7 = new BGSprite('deadcity/7', 1000, 800, 1.4, 1.3);
		bg7.updateHitbox();
		add(bg7);
		bg7.setGraphicSize(Std.int(bg7.width));

		bg5 = new BGSprite('deadcity/5', 1000, 800, 1.4, 1.3);
		bg5.updateHitbox();
		add(bg5);
		bg5.setGraphicSize(Std.int(bg5.width));

		bg5alt = new BGSprite('deadcity/6', 1000, 800, 1.4, 1.3);
		bg5alt.updateHitbox();
		add(bg5alt);
		bg5alt.setGraphicSize(Std.int(bg5alt.width));

		bg5.alpha = bg5alt.alpha = 0;
	}

	override function beatHit()
	{
		if (curBeat%2 == 0) {
			bg5.visible = true;
			bg5alt.visible = false;
		} else if (curBeat%0.5 == 0) {
			bg5.visible = false;
			bg5alt.visible = true;
		}
	}

	override function countdownTick(count:Countdown, num:Int)
	{
		switch(num)
		{
			case 4:
				if (songName == "imitate") {
					video.play(Paths.video("imitate-intro"));
				}
		}
	}
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
		{
			switch(eventName)
			{
				case "Deadcity Light":
					if (value1 == "true")
						bg5.alpha = bg5alt.alpha = 1;
					else
						bg5.alpha = bg5alt.alpha = 0;
			}
		}
}