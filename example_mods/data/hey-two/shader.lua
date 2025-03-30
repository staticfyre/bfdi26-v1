function onCreatePost()
        --luaDebugMode = true;
        if (shadersEnabled) then
            initLuaShader("RGB_PIN_SPLIT");
            initLuaShader("bloom");
            
            makeLuaSprite("temporaryShader");
            makeGraphic("temporaryShader", screenWidth, screenHeight);
            
            setSpriteShader("temporaryShader", "RGB_PIN_SPLIT");
            setShaderFloat("temporaryShader", "amount",0);

            makeLuaSprite("temporaryShader2");
            makeGraphic("temporaryShader2", screenWidth, screenHeight);
            
            setSpriteShader("temporaryShader2", "bloom");
            setShaderFloat("temporaryShader2", "u_brightness",0);
            setShaderFloatArray('temporaryShader2', 'u_samples', {8, 8})
            setShaderFloatArray('temporaryShader2', 'u_size', {20, 20}) 
            setShaderFloatArray('temporaryShader2', 'u_tint', {1, 1, 1})
            
            runHaxeCode([[
                trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader2").shader))]);
game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader2").shader))]);
            ]]);
        end
    end