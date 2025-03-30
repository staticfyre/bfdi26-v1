package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;
import backend.CoolUtil;
import backend.Highscore;
import objects.BFDI26Mouse;
import Setup;

class MainBFDI extends MusicBeatState
{
	var myStupidFuckMenus:Array<String> = ["freeplay", "credits", "settings"];
	var menuItems:FlxTypedGroup<FlxSprite>;
	var evilTV:FlxSprite;

	override function create()
	{
		FlxG.camera.bgColor = FlxColor.BLACK;

		#if DISCORD_ALLOWED DiscordClient.changePresence("BFDI 26 - MAIN MENU", null); #end
		Mods.loadTopMod();
		Difficulty.resetList();

		menuItems = new FlxTypedGroup<FlxSprite>();
		for (i in 0...myStupidFuckMenus.length)
		{
			var poopString:String = myStupidFuckMenus[i];
			var menuXX:Int = 420;
			var menuYY:Int = 65;

			var menuItem:FlxSprite = new FlxSprite(menuXX * i, menuYY);
			if ( i == 1 ) { 
				menuItem.y = menuYY*7; 
				menuItem.x = menuXX + 35;
			}
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.frames = Paths.getSparrowAtlas('cool menu/' + poopString);
			menuItem.animation.addByPrefix('idle', poopString.toUpperCase(), 12, true);
			menuItem.animation.play('idle');

			menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
			menuItem.ID = i;
			menuItems.add(menuItem);
		}
		add(menuItems);

		evilTV = new FlxSprite( 420 + 45, 65*1.4);
		evilTV.antialiasing = ClientPrefs.data.antialiasing;
		evilTV.frames = Paths.getSparrowAtlas('cool menu/bfdi26');
		evilTV.animation.addByPrefix('idle', 'BFDI26', 12, true);
		evilTV.animation.play('idle');
		evilTV.setGraphicSize(Std.int(evilTV.width * 0.7));
		add(evilTV);

		FlxG.mouse.visible = true;
		FlxG.mouse.load(Setup.mouseGraphic,0.1);
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.mouse.visible) {
			cameraMovement(elapsed);

			if (menuItems != null) {
				for(i in menuItems.members){ 
					if(FlxG.mouse.overlaps(i)){
						i.alpha = 0.5;
						if(FlxG.mouse.justPressed) hey(i.ID);
					} else i.alpha = 1;
				}
			}
	
			if(FlxG.mouse.overlaps(evilTV) && FlxG.mouse.justPressed) {
				#if DISCORD_ALLOWED DiscordClient.changePresence("BFDI 26 - WHAT\'S THIS?", null); #end
				FlxG.mouse.visible = false;
				FlxTween.tween(FlxG.sound.music, {pitch: 0, volume: 10}, 1, {ease: FlxEase.quadOut});
				FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.4},1, {ease: FlxEase.sineInOut});
				new FlxTimer().start(5,Void->{
					FlxG.camera.fade(FlxColor.BLACK, 2, false, function() {
						loadSong('yoylefake');
					});
				});
			}
		}

		super.update(elapsed);
	}	

	function hey(id:Int){
		var fucjk = Highscore.getSongData('yoylefake', 1);
		switch(myStupidFuckMenus[id]){
			case 'freeplay': 
				if (fucjk.songScore > 0) switchS(1);
				else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					return;
				} 
			case 'credits':  switchS(2);
			case 'settings': switchS(3);
		}
	}

	function loadSong(name:String)
    {
        PlayState.SONG = backend.Song.loadFromJson(name, name);
		PlayState.isStoryMode = false;
		PlayState.yoylefakeStart = true;

        FlxG.switchState(new PlayState());
    }

	function switchS(ops:Int) {
		FlxG.mouse.visible = false;
		FlxG.sound.play(Paths.sound('confirmMenu'));
		new FlxTimer().start(1,Void->{
			FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 0.7},2, {ease: FlxEase.sineInOut});

			new FlxTimer().start(0.5,Void->{
				FlxG.camera.fade(FlxColor.BLACK, 1, false, function() {
					switch(ops) {
						case 1: MusicBeatState.switchState(new FreeplayState());
						case 2: 
							FlxG.sound.music.fadeOut(0.3);
							MusicBeatState.switchState(new CreditsState());
						case 3: 
							MusicBeatState.switchState(new OptionsState());
							OptionsState.onPlayState = false;
							if (PlayState.SONG != null)
							{
								PlayState.SONG.arrowSkin = null;
								PlayState.SONG.splashSkin = null;
								PlayState.stageUI = 'normal';
							}
					}
				});
			});
		});
	}

	function cameraMovement(e:Float) 
    {
        final newX = ((FlxG.mouse.screenX - (FlxG.width/2)) / 40);
        final newY = ((FlxG.mouse.screenY - (FlxG.height/2)) / 40);

        FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, newX,1 - Math.exp(-e * 2));
        FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, newY,1 - Math.exp(-e * 2));
    }
}