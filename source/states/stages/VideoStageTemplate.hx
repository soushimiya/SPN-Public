package states.stages;

import objects.Character;

import hxcodec.flixel.FlxVideo as VideoHandler;


var video:VideoHandler;

class VideoStageTemplate extends BaseStage
{
	override function create()
	{
		video = new VideoHandler();
		video.pause();
		//video.camera = camGame;
		video.x = 0;
		video.y = 0;
		var bg:BGSprite = new BGSprite('deadcity/1', 0, 0, 0, 0);
		bg.updateHitbox();
		add(bg);

		var bg2:BGSprite = new BGSprite('deadcity/2', 0, -450, 0.4, 0.4);
		bg2.updateHitbox();
		add(bg2);
		
		var bg3:BGSprite = new BGSprite('deadcity/3', 0, -450, 0.7, 0.7);
		bg3.updateHitbox();
		add(bg3);

		var bg4:BGSprite = new BGSprite('deadcity/4', 0, 0, 1, 1);
		bg4.updateHitbox();
		add(bg4);
	}

	override function countdownTick(count:Countdown, num:Int)
	{
		switch(num)
		{
			case 4:
				video.resume();
				video.play(Paths.video("lazy"));
		}
	}
}