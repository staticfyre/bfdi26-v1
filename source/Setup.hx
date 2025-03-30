package;

import BootFlashingState;
import flixel.input.keyboard.FlxKey;
import openfl.display.BitmapData;

class Setup extends flixel.FlxState
{
    public static var muteKeys:Array<FlxKey> = [FlxKey.ZERO];
	public static var volumeDownKeys:Array<FlxKey> = [FlxKey.NUMPADMINUS, FlxKey.MINUS];
	public static var volumeUpKeys:Array<FlxKey> = [FlxKey.NUMPADPLUS, FlxKey.PLUS];

	public static var mouseGraphic:BitmapData = BitmapData.fromFile('assets/shared/images/mouse.png');

    override function create() 
    {
        super.create();

        #if LUA_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		FlxG.fixedTimestep = false;
		FlxG.game.focusLostFramerate = 60;
		FlxG.keys.preventDefaultKeys = [TAB];

		FlxG.save.bind('funkin', CoolUtil.getSavePath());

		ClientPrefs.loadPrefs();

		backend.Highscore.load();

		if (FlxG.save.data != null)
		{
			if (FlxG.save.data.fullscreen) FlxG.fullscreen = FlxG.save.data.fullscreen;
			if (FlxG.save.data.weekCompleted != null) states.StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}
		
		if (!FlxG.save.data.shitCheck) FlxG.switchState(new BootFlashingState());
        else FlxG.switchState(new states.TitleState());
    }
}