import backend.ALSoftConfig;

var appear;

function onSongStart() {
    game.triggerEvent('dumb video','dottedline','',Conductor.songPosition);
}

function onCreate(){
    appear = new FlxAnimate(-380,-410,'mods/images/characters/oneAppear');
    appear.showPivot = false;
    appear.scale.set(0.8,0.8);
    appear.anim.addBySymbol('oneAPPEAR', 'oneAPPEAR',0,0,24);
    appear.antialiasing = ClientPrefs.data.antialiasing;
    appear.visible = false;
    appear.cameras = [game.camGame];
    insert(members.indexOf(game.boyfriendGroup)+1, appear);
}

function onEvent(ev, v1, v2){
    if(ev == "Trigger"){
        switch(v1){
            case 'background3':
                game.dadGroup.x += 270;
                game.boyfriendGroup.y += 400;
                appear.visible = true;
                appear.anim.play('oneAPPEAR');
                game.dadGroup.visible = false;
                new FlxTimer().start(2,Void->{
                    game.dadGroup.visible = true;
                    appear.destroy();
                });
        }
    }
}