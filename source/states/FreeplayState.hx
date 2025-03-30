package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;
import flixel.input.mouse.FlxMouse;
import flixel.input.mouse.FlxMouseEvent;
import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;
import flixel.math.FlxMath;
import states.MainBFDI;
import states.PlayState;
import backend.ClientPrefs;
import flixel.animation.FlxAnimationController;
import flixel.addons.display.FlxBackdrop;
import shaders.WiggleEffect;
import shaders.WiggleEffect.WiggleEffectType;
import Ok;

class FreeplayState extends MusicBeatState
{
    var songs:Array<Hype> = [];
	var imgs:FlxTypedGroup<FlxSprite>;
	var curSel:Int = 0;
	var framey:FlxSprite;

	var check:FlxSprite;
	var token:FlxSprite;

	var scoreText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	var arrow:FlxSprite;
	var arrow2:FlxSprite;

	public static var vocals:FlxSound = null; //wtv
	var fuckkkk:Bool = true;
	var unknown:FlxSprite;
	var gold:Bool = false;

	var coolwiggle:WiggleEffect;
	var pride:FlxSprite;
	var prideTween:FlxTween;

	override function create() {
		Paths.clearStoredMemory();

		DiscordClient.changePresence("BFDI 26 - FREEPLAY OF GOODIES", null);

		coolwiggle = new WiggleEffect();
		coolwiggle.effectType = WiggleEffectType.HEAT_WAVE_HORIZONTAL;
		coolwiggle.waveAmplitude = 0.2;
		coolwiggle.waveFrequency = 1;
		coolwiggle.waveSpeed = 1;

		var bg = new FlxBackdrop(Paths.image('freeplay/background'),X,0,0);
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.setGraphicSize(Std.int(bg.width * 0.5));
		bg.screenCenter();
		bg.velocity.x = -15;
		bg.scrollFactor.set();

		makeStuff();

		unknown = new FlxSprite().loadImage('freeplay/thumbnails/unknown');
		unknown.setGraphicSize(Std.int(unknown.width * 0.7));
		unknown.screenCenter();
		unknown.antialiasing = ClientPrefs.data.antialiasing;
		add(unknown);
		unknown.shader = coolwiggle.shader;

		framey = new FlxSprite().loadGraphic(Paths.image('freeplay/frame'));
		add(framey);
		framey.setGraphicSize(Std.int(framey.width * 0.7));
		framey.screenCenter();

	    arrow = new FlxSprite().loadGraphic(Paths.image('freeplay/arrow'));
		add(arrow);
		arrow.screenCenter();
		arrow.x += 540;
		arrow.scale.set(0.5,0.5);

		arrow2 = new FlxSprite().loadGraphic(Paths.image('freeplay/arrow'));
		add(arrow2);
		arrow2.screenCenter();
		arrow2.x -= 540;
		arrow2.scale.set(0.5,0.5);
		arrow2.flipX = true;

		var bfdi26bg = new FlxSprite().loadGraphic(Paths.image('freeplay/vignette'));
		add(bfdi26bg);
		bfdi26bg.scrollFactor.set();
		bfdi26bg.screenCenter();

		makeShit();

		scoreText = new FlxText(FlxG.width-1250, 650, 0, "");
		scoreText.setFormat(Paths.font("Shag-Lounge.otf"), 60, FlxColor.WHITE, LEFT);
		scoreText.antialiasing = ClientPrefs.data.antialiasing;
		add(scoreText);

		FlxG.mouse.visible = true;
		FlxG.mouse.load(Setup.mouseGraphic,0.1);
		changeSelection();
		super.create();

		Paths.clearUnusedMemory();
	}

	function prideGo() {
		FlxG.sound.playMusic(Paths.music('pridejingle'));
		var pridemouse:openfl.display.BitmapData = openfl.display.BitmapData.fromFile('assets/shared/images/freeplay/CURSORx2.png');
		FlxG.mouse.load(pridemouse,0.5);
		var flip = FlxG.random.bool(50); 
		pride = new FlxSprite().loadFrames('freeplay/pride');
		pride.addAnimByPrefix('click','pride_clicked',24,false);
		pride.addAndPlay('i','pride_walk',24,true);
		pride.screenCenter(Y);
		if (flip) {
			pride.flipX = true;
			pride.x = FlxG.width+100;
			prideTween = FlxTween.tween(pride, {x: FlxG.width-2300}, 9.5, {ease: FlxEase.linear, onComplete:Void->{pEnd();}});
		} else {
			pride.x -= 1060;
			prideTween = FlxTween.tween(pride, {x: FlxG.width+25}, 9.5, {ease: FlxEase.linear, onComplete:Void->{pEnd();}});
		}
		pride.updateHitbox();
		pride.antialiasing = ClientPrefs.data.antialiasing;
		add(pride);
	}

	function pEnd() {
		if (pride != null && prideTween != null && fuckkkk) {
		    remove(pride);
			pride = null;
			prideTween = null;
			FlxG.mouse.load(Setup.mouseGraphic,0.1);
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
	}

	function makeShit() {
		check = new FlxSprite().loadFrames('freeplay/checkmarkFREEPLAY');
		check.addAnimByPrefix('n','notplay',1);
		check.addAnimByPrefix('p','played',1);
		check.scale.set(0.5,0.5);
		check.antialiasing = ClientPrefs.data.antialiasing;
		check.x = imgs.members[0].x + 125;
		check.y = check.y - 20;
		add(check);

		token = new FlxSprite().loadFrames('freeplay/wintokenFREEPLAY');
		token.addAnimByPrefix('c','clear',16,true);
		token.addAnimByPrefix('fc','fc',1,false);
		token.addAnimByPrefix('gfc','gfc',1,false);
		token.addAnimByPrefix('pfc','pfc',16,true);
		token.scale.set(0.6,0.6);
		token.antialiasing = ClientPrefs.data.antialiasing;
		token.x = imgs.members[0].x + 250;
		token.y = token.y - 10;
		add(token);
	}

	var nullt:FlxSprite = null;
	function makeStuff() {
        PlayState.isStoryMode = false;
		WeekData.reloadWeekFiles(false);

		for (i in 0...WeekData.weeksList.length)
		{
			var curWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			WeekData.setDirectoryFromWeek(curWeek);
			for (song in curWeek.songs)
			{
				if (song[0] == 'oneshot' && !Ok.isOneshotUnlocked) continue;
                if (song[0] == 'web-crasher' && !Ok.isWebCrashed) continue;
                songs.push({
                    ohio: song[0],
                    week: song[1],
                    folder: Mods.currentModDirectory
                });
			}
		}
		Mods.loadTopMod();

        imgs = new FlxTypedGroup<FlxSprite>();
        for (k => i in songs) {
            var thumbnails = new FlxSprite().loadImage('freeplay/thumbnails/${i.ohio}');
			thumbnails.setGraphicSize(Std.int(thumbnails.width * 0.7));
			thumbnails.screenCenter();
            thumbnails.hide();
			thumbnails.antialiasing = ClientPrefs.data.antialiasing;
            imgs.add(thumbnails);
            nullt = thumbnails;
        }
		add(imgs);
    }

	var scrollTmr:Float = 0;
	var timer:Float = FlxG.random.int(10, 200); //50, 300 //200
	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.FOUR) FlxG.resetState();
		coolwiggle.update(elapsed);

		if (gold) framey.color = 0xFFF4C52C;
		else      framey.color = FlxColor.WHITE; 

		if (fuckkkk) {
			if (pride == null) {
				if ((controls.UI_LEFT_P) || (FlxG.mouse.overlaps(arrow2) && FlxG.mouse.justPressed)) changeSelection(-1,"left");
				if ((controls.UI_RIGHT_P) || (FlxG.mouse.overlaps(arrow) && FlxG.mouse.justPressed)) changeSelection(1,"right");

				if (controls.BACK)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxG.switchState(new MainBFDI());
					if (timer <= 0 && pride != null) {
						remove(pride);
						pride = null;
					}
				}
			}

			if (!Ok.isWebCrashed) {
				if (pride == null) {
					timer -= elapsed;
					if (timer <= 0)
					{
						prideGo();
						timer = FlxG.random.int(10, 200);
					}
				}
				trace(timer);
			}

			if (controls.ACCEPT) prepload();
			if (pride != null) {
				if (FlxG.fullscreen) FlxG.fullscreen = false;
				if (FlxG.mouse.overlaps(pride) && FlxG.mouse.justPressed) {
					fuckkkk = false;
					pride.playAnimation('click');
					FlxG.sound.music.stop();
					FlxG.sound.play(Paths.sound('pop'));
					prideTween.cancel();
					FlxTween.tween(pride, {'scale.x': 0.01},3,{ease: FlxEase.quadInOut, startDelay: 2});
					FlxTween.tween(pride, {'scale.y': 0.01},1.6,{ease: FlxEase.quadInOut, startDelay: 3});
					new FlxTimer().start(4.2,Void->{prepload(true);});
				}
				pride.updateHitbox();
			}
		}
		
		super.update(elapsed);

		scrollTmr+= elapsed;
		while (scrollTmr >= 1)
		{
			scrollTmr -= 1;
			FlxG.camera.scroll.x = FlxG.random.float(-0.8, 0.8);
			FlxG.camera.scroll.y = FlxG.random.float(-0.9, 0.9);
		}
	}

    function prepload(web:Bool = false) {
		fuckkkk = false;

		FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.8},1, {ease: FlxEase.sineInOut});
		if (FlxG.sound.music != null) FlxTween.tween(FlxG.sound.music, {pitch: 0}, 1, {ease: FlxEase.quadOut});
		if (unknown.visible) FlxTween.tween(FlxG.camera, {angle: FlxG.camera.angle + 60},1, {ease: FlxEase.sineInOut, startDelay: 0.43});

		FlxG.camera.fade(FlxColor.BLACK, 1, false, function() {
			new FlxTimer().start(2,Void->{
				if (web) {
					load(true);
				} else load(false);
			});
		});
    }

	function load(web:Bool = false) {
		if (web) {
			PlayState.SONG = Song.loadFromJson('web-crasher', 'web-crasher');
			PlayState.isStoryMode = false;
			MusicBeatState.switchState(new PlayState());
		} else {
			if (FlxG.sound.music != null) {
				FlxG.sound.music.stop();
				FlxG.sound.music.volume = 0;
			}

			var yoursong = songs[curSel].ohio;
			var songPath:String = Paths.formatToSongPath(yoursong);
			var formatedPath:String = Highscore.formatSong(songPath, 1);

			try
			{
				PlayState.SONG = Song.loadFromJson(formatedPath, songPath);
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 1;
			}
			catch(e:Dynamic)
			{
				trace('ERROR! $e');
				return;
			}

			LoadingState.loadAndSwitchState(new PlayState());
			destroyFreeplayVocals();
		}
	}

	function changeSelection(change:Int = 0, arrowDir:String = '')
	{
		if(change != 0) FlxG.sound.play(Paths.sound('scrollMenu'));

        imgs.members[curSel].hide();
		curSel = FlxMath.wrap(curSel + change,0,songs.length-1);
        imgs.members[curSel].alpha=1;
        Mods.currentModDirectory = songs[curSel].folder;

		switch (arrowDir) {
			case "left":
				arrow2.scale.set(0.48,0.48);
				new FlxTimer().start(0.07, Void -> {arrow2.scale.set(0.5,0.5);});
			case "right":
				arrow.scale.set(0.48,0.48);
				new FlxTimer().start(0.07, Void -> {arrow.scale.set(0.5,0.5);});
		}

		updateShit();
		scoreThing();
	}

	function updateShit() {
		scoreText.text = 'Score: ' + Std.string(Highscore.getSongData(songs[curSel].ohio,1).songScore);

		var fucjk = Highscore.getSongData(songs[curSel].ohio,1); //thank you data saved me last minute
		if (fucjk.songScore > 0) {
			check.animation.play('p');
			token.visible = true;
			unknown.visible = false;
			switch (fucjk.songFC) {
				case SDCB:
					gold = false;
					token.animation.play('c');
				case FC:
					gold = false;
					token.animation.play('fc');	
				case GFC:
					gold = false;
					token.animation.play('gfc');
				case PFC: 
					gold = true;
					token.animation.play('pfc');
			}
		} else {
			check.animation.play('n');
			token.visible = gold = false;
			unknown.visible = true;
		}
	}
	
	var scoretwn:FlxTween;
	public function scoreThing() {
		if(scoretwn != null) scoretwn.cancel();
		scoreText.scale.x = 1.075;
		scoreText.scale.y = 1.075;
		scoretwn = FlxTween.tween(scoreText.scale, {x: 1, y: 1}, 0.2, {ease: FlxEase.quadInOut, onComplete: function(twn:FlxTween) {scoretwn = null;}});
	}
	
	public static function destroyFreeplayVocals() {
		if(vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	override function destroy():Void
	{
		super.destroy();
		FlxG.autoPause = ClientPrefs.data.autoPause;
	}	
}
typedef Hype = {ohio:String,week:Int,folder:String} 