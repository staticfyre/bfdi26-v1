package flixel.system;

import hxvlc.flixel.FlxVideo;
import openfl.display.Graphics;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import Setup;
import Main;

class FlxSplash extends MusicBeatState
{
	public static var nextState:Class<FlxState>;

	/**
	 * @since 4.8.0
	 */
	public static var muted:Bool = #if html5 true #else false #end;

	var _sprite:Sprite;
	var _gfx:Graphics;
	var _text:TextField;

	var _times:Array<Float>;
	var _colors:Array<Int>;
	var _functions:Array<Void->Void>;
	var _curPart:Int = 0;
	var _cachedBgColor:FlxColor;
	var _cachedTimestep:Bool;
	var _cachedAutoPause:Bool;

	var video:FlxVideo;

	override public function create():Void
	{
		_cachedBgColor = FlxG.cameras.bgColor;
		FlxG.cameras.bgColor = FlxColor.BLACK;
		FlxG.mouse.visible = false;

		_cachedTimestep = FlxG.fixedTimestep;
		FlxG.fixedTimestep = false;

		_cachedAutoPause = FlxG.autoPause;
		FlxG.autoPause = false;

		#if FLX_KEYBOARD
		FlxG.keys.enabled = true;
		#end

		new FlxTimer().start(1, function(tmr:FlxTimer){
			video = new FlxVideo();
			video.onEndReached.add(onComplete,true);
			video.load(Paths.video('intro'));
			video.play();
		});
	}

	override function update(elapsed:Float) {
		if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER) {
			if (video != null) {
				video.stop();
				onComplete();
			}
		}
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function onResize(Width:Int, Height:Int):Void
	{
		super.onResize(Width, Height);
	}

	function onComplete():Void
	{
		FlxG.cameras.bgColor = _cachedBgColor;
		FlxG.fixedTimestep = _cachedTimestep;
		FlxG.autoPause = _cachedAutoPause;
		#if FLX_KEYBOARD
		FlxG.keys.enabled = true;
		#end
		video.dispose();
		FlxG.switchState(new Setup());
	}
}
