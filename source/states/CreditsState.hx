package states;

import flixel.addons.effects.FlxSkewedSprite;

class CreditsState extends MusicBeatState
{
	var bg:FlxSkewedSprite;
	override function create()
	{
		Paths.clearStoredMemory();

		DiscordClient.changePresence("BFDI 26 - DEVELOPMENT TEAM", null);

		persistentUpdate = true;

		bg = new FlxSkewedSprite(0,0,Paths.image("credits"));
		bg.screenCenter();
		bg.setGraphicSize(0,FlxG.width-555);
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);

		FlxG.sound.playMusic(Paths.music('Creditstheme'));
		FlxG.camera.zoom += 0.4;
		super.create();

		Paths.clearUnusedMemory();
	}

    var _intervalTimer:Float = 0;
	var stop:Bool = false;
	override function update(elapsed:Float)
	{
		if (controls.BACK && !stop) goodbye();
		
		super.update(elapsed);

		_intervalTimer+= elapsed;
        while (_intervalTimer >= 1)
        {
            _intervalTimer -= 1;
            onInterval();
        }
	}

	function goodbye() {
		stop = true;
		FlxG.sound.play(Paths.sound('cancelMenu'));
		FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.9},2, {ease: FlxEase.sineInOut});
		new FlxTimer().start(0.4,Void->{
			FlxG.sound.music.fadeOut(0.7);
			FlxG.camera.fade(FlxColor.BLACK, 1, false, function() {
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
				FlxG.switchState(new states.MainBFDI());
			});
		});
	}

	function onInterval()
	{
		bg.skew.x = FlxG.random.float(-0.7, 0.7);
		bg.skew.y = FlxG.random.float(-0.7, 0.7);
	}
}
