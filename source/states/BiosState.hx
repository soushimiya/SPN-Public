package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;
import flixel.addons.display.FlxBackdrop;
import objects.Character;

import flixel.addons.transition.FlxTransitionableState;

class BiosState extends MusicBeatState
{
	var biosArray:Array<Dynamic> = [
        ['Soni', "A hedgehog-human hybrid, \nhe is a Sonic fanboy,\nnot an anthropomorphized\nversion of Sonic.\nHe is also a serious Coke addict\nand has a surprisingly \nlow intelligence \nbut high fighting ability.","0a16ff"],
        ['Tel', "A fox-human hybrid, \nSoni's younger brother, \nhe is always energetic, \ncheerful and mischievous. \nHe loves to have fun and \ncan get out of hand when \nhe gets too excited...","ffce0a"],
        ['Nad', "He says he is a hybrid of \nechidna and human, \nbut the truth is unknown. \nHe has incredible arm strength \nand can easily break rocks. \nHe lives in the forest \nand is an old friend of Soni's. \nHe is more intelligent than Soni.","ff1414"],
		['Soniexe', "A demon has possessed Soni from \nanother world,\nand he plans to kill him \nand become the real Soni himself.\nHe fights with a knife \nand is a bastard who kills people \nfor his own pleasure.","420000"]
	];
	var curcharacter = 0;
	var bg:FlxSprite;
	var checker:FlxBackdrop = new FlxBackdrop(Paths.image('Free_Checker'), XY);

	var characterTxt:FlxText;
	var infoTxt:FlxText;
	var ch:Character;

	override function create()
	{
		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		DiscordClient.changePresence("In the Menus", null);

		Conductor.bpm = 72.5;

		bg = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, 0);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);
		bg.color = FlxColor.fromString('#'+biosArray[curcharacter][2]);
		
		add(checker);
		checker.velocity.set(-50,-50);
		checker.alpha = 0.5;
		checker.scrollFactor.set(0, 0);

		characterTxt = new FlxText(350, 100, FlxG.width - 100, biosArray[curcharacter][0], 24);
		characterTxt.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		characterTxt.scrollFactor.set(0,0);
		add(characterTxt);

		infoTxt = new FlxText(550, 0, FlxG.width - 100, biosArray[curcharacter][1], 15);
		infoTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		infoTxt.scrollFactor.set(0,0);
		add(infoTxt);
		infoTxt.screenCenter(Y);

		ch = new Character(15, 0, biosArray[curcharacter][0].toLowerCase());
		ch.screenCenter(Y);
		add(ch);
		super.create();
		var skip:Bool = FlxTransitionableState.skipNextTransOut;
		if(!skip) {
			openSubState(new CustomFadeTransition(0.6, true));
		}
		changeChar(0);
	}

	override function update(elapsed:Float)
	{
		Conductor.songPosition = FlxG.sound.music.time;
		if(controls.UI_LEFT_P)
			changeChar(-1);
		if(controls.UI_RIGHT_P)
			changeChar(1);
		if (controls.BACK) {
			MusicBeatState.switchState(new FreeplayState());
		}
		super.update(elapsed);
	}
	function changeChar(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curcharacter += change;

		if (curcharacter < 0)
			curcharacter = biosArray.length - 1;
		if (curcharacter >= biosArray.length)
			curcharacter = 0;

		bg.color = FlxColor.fromString('#'+biosArray[curcharacter][2]);
		//bg.color = FlxColor.fromRGB(ch.healthColorArray[0], ch.healthColorArray[1], ch.healthColorArray[2]);

		characterTxt.text = biosArray[curcharacter][0];
		characterTxt.screenCenter(X);

		infoTxt.text = biosArray[curcharacter][1];
		infoTxt.screenCenter(Y);

		remove(ch);
		ch = new Character(15, 0, biosArray[curcharacter][0].toLowerCase());
		ch.screenCenter(Y);
		add(ch);
		if (ch.curCharacter == "soniexe") {
			ch.x = -170;
			ch.y = -130;
			characterTxt.text = "soni.exe";
		}
	}
	override function beatHit() {
		super.beatHit();
		ch.dance();
	}
}
