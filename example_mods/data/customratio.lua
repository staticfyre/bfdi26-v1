local keep = false
function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
    setPropertyFromClass("openfl.Lib", "application.window.resizable", false)

    addHaxeLibrary("Math")
    addHaxeLibrary("RatioScaleMode", "flixel.system.scaleModes")
    runHaxeCode("FlxG.scaleMode = new RatioScaleMode(true);")

    local w, h = 960, 720
    keep =
        getPropertyFromClass("openfl.Lib", "application.window.width") ~= w or
            getPropertyFromClass("openfl.Lib", "application.window.height") ~= h
    setPropertyFromClass("flixel.FlxG", "width", w)
    setPropertyFromClass("flixel.FlxG", "height", h)

    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.x", 1)
    setPropertyFromClass("flixel.FlxG", "scaleMode.scale.y", 1)
    setPropertyFromClass("flixel.FlxG", "game.x", 0)
    setPropertyFromClass("flixel.FlxG", "game.y", 0)

    runHaxeCode([[
        var w = ]] .. w .. [[;
        var h = ]] .. h .. [[;
        for (cam in FlxG.cameras.list) {
            var oldW = cam.width;
			var oldH = cam.height;

			var newW = Math.ceil(w / cam.zoom);
			var newH = Math.ceil(h / cam.zoom);

			cam.setSize(newW, newH);
			cam.flashSprite.x += (newW - oldW) / 2;
			cam.flashSprite.y += (newH - oldH) / 2;
        }
        FlxG.resizeWindow(w, h);
    ]])
end

function onCreatePost() 
    if keep then 
        restartSong(true) 
    end
end

        function onCountdownStarted()
            for i = 0, getProperty("strumLineNotes.length") - 1 do
            setPropertyFromGroup("strumLineNotes", i, "x", getPropertyFromGroup("strumLineNotes", i, "x") - 70)
    end
    if middlescroll == true then
        for i = 0, getProperty("strumLineNotes.length") - 1 do
            setPropertyFromGroup("strumLineNotes", i, "x", getPropertyFromGroup("strumLineNotes", i, "x") +7.5)
        end
    for i = 4, getProperty('strumLineNotes.members.length') do
    noteTweenX('middlescrollfix'..i..'',i,(getProperty('strumLineNotes.members['..i..'].x')+75),0.001)
        end
        end
    end

function onDestroy()
    if getPropertyFromClass("openfl.Lib", "application.window.fullscreen") == true then
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen",false)
    end
    if not keep then
        setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
        runHaxeCode([[
            FlxG.scaleMode = new RatioScaleMode();
            FlxG.resizeGame(FlxG.initialWidth, FlxG.initialHeight);
            FlxG.resizeWindow(FlxG.initialWidth, FlxG.initialHeight);
            if (FlxG.camera != null) {
                FlxG.camera.width = FlxG.width;
                FlxG.camera.height = FlxG.height;
            }
        ]])
    end
end


function onUpdatePost()
if getPropertyFromClass("openfl.Lib", "application.window.fullscreen") == true then
    setPropertyFromClass("flixel.FlxG", "game.x",250)
else
    setPropertyFromClass("flixel.FlxG", "game.x",0)
end
end