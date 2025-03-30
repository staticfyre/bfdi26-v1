function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
setProperty('camHUD.visible',false)
setProperty('camGame.filtersEnabled', false)
end

function onCreatePost()
        --luaDebugMode = true;
        if (shadersEnabled) then
            initLuaShader("vhs");
            
            makeLuaSprite("temporaryShader");
            makeGraphic("temporaryShader", screenWidth, screenHeight);
            
            setSpriteShader("temporaryShader", "vhs");
            
            addHaxeLibrary("ShaderFilter", "openfl.filters");
            runHaxeCode([[
                trace(ShaderFilter);
                game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            ]]);
        end
    end

function onUpdatePost()
setShaderFloat('temporaryShader','iTime',os.clock())
end

function onStepHit()
if curStep == 64 then
    setProperty('camGame.visible',true)
    setProperty('camHUD.visible',true)
    setProperty('camGame.filtersEnabled',true)
end
end