function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
setProperty('camHUD.visible',false)
setProperty('camGame.filtersEnabled', false)

    makeLuaSprite('sky','backgrounds/time/itftBACK',-250,-600)
    scaleObject('sky',1.1,1.1)
    setScrollFactor('sky',0.95,0.95)
    addLuaSprite('sky')

    makeLuaSprite('background','backgrounds/time/itft',-125,500)
    scaleObject('background',1.1,1.1)
    addLuaSprite('background')

    -- characters
    makeAnimatedLuaSprite('v', 'backgrounds/time/vasey',2550,385)
    setScrollFactor('v',1.1,1.1)
    addLuaSprite('v',true)

    makeAnimatedLuaSprite('w', 'backgrounds/time/wheel',2550,585)
    setScrollFactor('w',1.1,1.1)
    addLuaSprite('w',true)

    makeAnimatedLuaSprite('wr', 'backgrounds/time/wheelchase',-725,385)
    setScrollFactor('wr',0.975,0.975)
    scaleObject('wr',0.535,0.535)
    addAnimationByPrefix('wr', 'run', 'Chase',24,true)
    addLuaSprite('wr',false)

    makeAnimatedLuaSprite('s', 'backgrounds/time/sun',50,-725)
    setScrollFactor('s',0.995,0.995)
    addLuaSprite('s',false)

    makeAnimatedLuaSprite('p', 'backgrounds/time/Polka',1350,-130)
    setProperty('p.visible',false)
    addLuaSprite('p',false)

    makeAnimatedLuaSprite('n', 'backgrounds/time/Noway',-150,325)
    addAnimationByPrefix('n', 'nwalk', 'Nowalk',24,true)
    addLuaSprite('n',false)
    --
    makeLuaSprite('t', 'rendersnlogos/clockrender',1000,0)
    setProperty('t.alpha',0)
    setObjectCamera('t','camHUD')
    scaleObject('t',0.75,0.75)
    addLuaSprite('t',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/timetext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 3000',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

    makeLuaText('timefor','CH 69',1000,650,0)
    setObjectCamera('timefor','other')
    setProperty('timefor.color',getColorFromHex('56B275'))
    setTextBorder('timefor',2,'16192D')
    setTextSize('timefor',75)
    addLuaText('timefor',true)
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