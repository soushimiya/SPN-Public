package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import lime.app.Application;
import options.OptionsState;
import states.FreeplayState;
import flixel.addons.display.FlxBackdrop;

#if VIDEOS_ALLOWED
#if (hxCodec >= "3.0.0") import hxcodec.flixel.FlxVideo as VideoHandler;
#elseif (hxCodec >= "2.6.1") import hxcodec.VideoHandler as VideoHandler;
#elseif (hxCodec == "2.6.0") import VideoHandler;
#else import vlc.MP4Handler as VideoHandler; #end
#end

class ThanksForPlaying extends MusicBeatState
{
	override function create()
	{
		var video:VideoHandler = new VideoHandler();
			#if (hxCodec >= "3.0.0")
			// Recent versions
			video.play(Paths.video("thanksforplaying"));
			video.onEndReached.add(function()
			{
				MusicBeatState.switchState(new FreeplayState());
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
			}, true);
			#else
			// Older versions
			video.playVideo(Paths.video("thanksforplaying"));
			video.finishCallback = function()
			{
				MusicBeatState.switchState(new FreeplayState());
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
			}
			#end
	}
}
