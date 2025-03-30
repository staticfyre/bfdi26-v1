package objects;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BFDI26Mouse extends FlxSprite
{
	public var mouseInteract:Bool;

	public function new(x:Float = 0, y:Float = 0, ?camera:FlxCamera, scaleX:Float = 0.4, scaleY:Float = 0.4) {
		super(x, y);
        if (camera == null) camera = FlxG.cameras.list[FlxG.cameras.list.length-1];

        frames = Paths.getSparrowAtlas('bfdi26mouse');
        animation.addByPrefix("idle", "mouse", 6, true);
        animation.addByPrefix("click", "click", 6, true);
        animation.play("idle");
        cameras = [camera];
        scale.x = scaleX;
        scale.y = scaleY;
        updateHitbox();
        antialiasing = ClientPrefs.data.antialiasing;
	}

    override function update(elapsed:Float){
        super.update(elapsed);
        if (mouseInteract) animation.play("click");
    }
}
