import substates.PauseSubState;

function onGameOver() {
    if (!game.startingSong) {
        game.inCutscene = true;
        game.updateTime = false;
        game.isDead = true;
        game.camZooming = false;
        game.persistentUpdate = false;
        game.persistentDraw = false;
        game.canPause = false;
        game.paused = true;
        for (i in [game.camHUD,game.camOther]) i.visible = false;
        FlxTween.tween(FlxG.sound.music, {pitch: 0}, 1, {ease: FlxEase.quadOut});
        FlxTween.tween(FlxG.camera, {zoom: FlxG.camera.zoom + 3, angle: 4}, 1, {ease: FlxEase.quadOut});
        game.vocals.volume = 0;
        game.vocals.pause();
        FlxG.camera.fade(FlxColor.BLACK, 0.6, false, function() {
            new FlxTimer().start(2,Void->{
                PauseSubState.restartSong(false);
            });
        });
        return Function_Stop;
    }
}