class Ok {
    public static var isOneshotUnlocked(get,set):Bool;
    static function set_isOneshotUnlocked(value:Bool):Bool {
        FlxG.save.data.onshotUnlock = value;
        FlxG.save.flush();
        return value;
    }
	static function get_isOneshotUnlocked():Bool return (FlxG.save.data.onshotUnlock != null && FlxG.save.data.onshotUnlock);

    public static var isWebCrashed(get,set):Bool;
    static function set_isWebCrashed(value:Bool):Bool {
        FlxG.save.data.webCrashed = value;
        FlxG.save.flush();
        return value;
    }
	static function get_isWebCrashed():Bool return (FlxG.save.data.webCrashed != null && FlxG.save.data.webCrashed);
}