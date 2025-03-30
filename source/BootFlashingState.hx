package;

import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.addons.ui.FlxUIState;
import backend.Controls;
import backend.ClientPrefs;
import flixel.addons.effects.FlxSkewedSprite;
import Main;

class BootFlashingState extends MusicBeatState //whatever man
{
    var allowedToSelect:Bool = false;

	final txt:Array<String> = ['WARNING', 'This mod contains\npossibly flashing lights\nand quick changing\ncolors, so be warned.', 'PRESS ENTER TO CONTINUE'];

	var logo:FlxSkewedSprite;
	var guys:FlxSkewedSprite;

    override function create() {
		FlxG.mouse.visible = false;
        Main.fpsVar.visible = false;
		FlxG.camera.bgColor = FlxColor.BLACK;
		FlxG.camera.antialiasing = ClientPrefs.data.antialiasing;

		var text = new FlxText(0,0,FlxG.width,'WARNING');
		text.setFormat(Paths.font("flashing.ttf"), 100, FlxColor.RED);
        text.x += 10;
		text.y += 70;
        text.alpha = 0;
        add(text);

		var text2 = new FlxText(0,0,FlxG.width,"This mod contains\npossibly flashing lights\nand quick changing colors,\nso be warned!");
		text2.setFormat(Paths.font("flashing.ttf"), 70, FlxColor.WHITE, LEFT);
		text2.y += 265;
		text2.x += 20;
		text2.alpha = 0;
		add(text2);

		var text3 = new FlxText(0,0,FlxG.width,"(This mod is BEST EXPERIENCED with shaders enabled and GPU caching, fyi!)");
		text3.setFormat(Paths.font("flashing.ttf"), 25, FlxColor.WHITE, LEFT);
		text3.y += 600;
		text3.x += 20;
		text3.alpha = 0;
		add(text3);

        var enter = new FlxText(0,0,FlxG.width,"PRESS ENTER TO CONTINUE");
		enter.setFormat(Paths.font("flashing.ttf"), 70, FlxColor.WHITE);
        enter.x += 10;
		enter.y += 640;
        enter.alpha = 0;
        add(enter);

		logo = new FlxSkewedSprite(0,0,Paths.image("flashLogo"));
		logo.y = text.y - 180;
		logo.x = text.x + 960;
		add(logo);

		guys = new FlxSkewedSprite(0,0,Paths.image("flashArt"));
		guys.y = text3.y - 90;
		guys.x = text3.x + 1200;
		guys.angle = 50;
		guys.scale.set(0.75,0.75);
		add(guys);

        var twn1 = FlxTween.tween(text, {alpha: 1}, 2, {ease: FlxEase.quadInOut, startDelay: 1});
        var twn2 = FlxTween.tween(text2, {alpha: 1}, 2, {ease: FlxEase.quadInOut, startDelay: 2});

        twn1.then(twn2);

		new FlxTimer().start(5, Void -> {
			FlxTween.tween(logo, {y: text.y - 50}, 2, {ease: FlxEase.quadInOut});
			FlxTween.tween(guys, {y: text3.y - 230, x: text3.x + 820, angle: 0}, 2, {ease: FlxEase.quadInOut});
		});

        new FlxTimer().start(12, Void -> {
			FlxTween.tween(text3, {alpha: 0.7}, 2, {ease: FlxEase.quadInOut});
            FlxTween.tween(enter, {alpha: 1}, 2, {ease: FlxEase.quadInOut, onComplete: Void ->{allowedToSelect = true;}});
		});
		
        super.create();
    }

    var scrollTmr:Float = 0;
    override function update(elapsed:Float)
    {
        super.update(elapsed);

		scrollTmr+= elapsed;

		final skewFactor = Math.cos(scrollTmr / 2.6 * Math.PI) / 2 + 0.5;
		logo.skew.x = -1 + skewFactor * (1 - -1);
		logo.skew.y = -1 + skewFactor * (1 - -1);

        while (scrollTmr >= 1)
        {
            scrollTmr -= 1;
			guys.skew.x = FlxG.random.float(-1, 1);
			guys.skew.y = FlxG.random.float(-1, 1);
        }

		if (controls.ACCEPT && allowedToSelect) {
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxG.save.data.shitCheck = true;
			allowedToSelect = false;
			FlxG.camera.fade(FlxColor.BLACK, 2, false, function() {
				Main.fpsVar.visible = ClientPrefs.data.showFPS;
				FlxG.switchState(new states.TitleState());
			});
		}
    
    }
}