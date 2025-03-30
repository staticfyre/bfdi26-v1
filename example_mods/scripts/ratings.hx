var originalOffsets:Array<Float>;

function onCreate () {
    originalOffsets = ClientPrefs.data.comboOffset.copy();
    for (i in 0...4) {
        ClientPrefs.data.comboOffset[i] = 0;
    }
}

function onUpdate() {
    comboGroup.cameras = [camGame];

    var offsetX:Float = -boyfriend.width;
    var offsetY:Float = -boyfriend.height;
    
    comboGroup.x = boyfriend.x + offsetX - 100;
    comboGroup.y = boyfriend.y + offsetY - 150;
}

function onDestroy () {
for (i in 0...4) {
    ClientPrefs.data.comboOffset[i] = originalOffsets[i];
}
}