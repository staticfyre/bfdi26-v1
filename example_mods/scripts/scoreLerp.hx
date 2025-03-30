var scoreLerp;
function onUpdatePost(elapsed:Float){
    scoreLerp = FlxMath.lerp(scoreLerp, PlayState.instance.songScore, 0.108);
    PlayState.instance.scoreTxt.text = 'Score: ' + Std.parseInt(scoreLerp);
}