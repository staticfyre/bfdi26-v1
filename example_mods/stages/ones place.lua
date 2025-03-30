background1 = true
background2 = false
background3 = false

function onSongStart()
    cameraFlash('camOther','000000',1)
end

function onCreate() 
    precacheImage('characters/one/one appearing')
    triggerEvent('Screen Shake','34,0.001','34,0.0005')
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
    doTweenAlpha('camhudhere','camHUD',1,10,'quadOut')

    -- 3
    makeAnimatedLuaSprite('skyb', 'backgrounds/dotted-line/3/sky waste of space',-275,-300)
    addAnimationByPrefix('skyb', 'skyold', 'sky instance 1',24,true)
    setScrollFactor('skyb',0.6,0.6)
    scaleObject('skyb',0.8,0.8)
    addLuaSprite('skyb',false)

    makeLuaSprite('grad', 'backgrounds/dotted-line/3/sky basketball gradient',-275,-75)
	setProperty('grad.alpha',1)
    addLuaSprite('grad',false)
    setBlendMode('grad','multiply')

    makeAnimatedLuaSprite('onep', 'characters/one/one appearing',-290,-365)
    addLuaSprite('onep',true)
    setProperty('onep.alpha',0.001)

    makeAnimatedLuaSprite('ground', 'backgrounds/dotted-line/3/ground behind',-140,200)
    addAnimationByPrefix('ground', 'ground', 'bg back instance 1',24,true)
    setScrollFactor('ground',0.7,0.7)
    scaleObject('ground',0.8,0.8)
    addLuaSprite('ground',true)

    makeAnimatedLuaSprite('grass', 'backgrounds/dotted-line/3/tree back 1',750,150)
    addAnimationByPrefix('grass', 'grass', 'tree back 1 instance 1',24,true)
    setScrollFactor('grass',0.7,0.7)
    scaleObject('grass',0.9,0.9)
    addLuaSprite('grass',true)

    makeAnimatedLuaSprite('grass2', 'backgrounds/dotted-line/3/tree back 2',285,415)
    addAnimationByPrefix('grass2', 'grass2', 'tree back 2 instance 1',24,true)
    setScrollFactor('grass2',0.7,0.7)
    scaleObject('grass2',0.9,0.9)
    addLuaSprite('grass2',true)

    makeAnimatedLuaSprite('grass3', 'backgrounds/dotted-line/3/tree back 3',-250,480)
    addAnimationByPrefix('grass3', 'grass3', 'tree back 3 instance 1',24,true)
    setScrollFactor('grass3',0.7,0.7)
    scaleObject('grass3',0.9,0.9)
    addLuaSprite('grass3',true)

    makeAnimatedLuaSprite('land', 'backgrounds/dotted-line/3/ground',-350,400)
    addAnimationByPrefix('land', 'land', 'ground  floor instance 1',24,true)
    setScrollFactor('land',0.7,0.7)
    scaleObject('land',0.9,0.9)
    addLuaSprite('land',true)

    makeAnimatedLuaSprite('grass4', 'backgrounds/dotted-line/3/bush front',-275,350)
    addAnimationByPrefix('grass4', 'grass4', 'bush front instance 1',24,true)
    setScrollFactor('grass4',0.85,0.85)
    scaleObject('grass4',0.9,0.9)
    addLuaSprite('grass4',true)

    -- 2
    makeAnimatedLuaSprite('sky', 'backgrounds/dotted-line/2/sky animated',25,-360)
    addAnimationByPrefix('sky', 'flowing', 'sky instance 1',24,true)
    scaleObject('sky',0.85,0.85)
    addLuaSprite('sky',false)

    makeAnimatedLuaSprite('water', 'backgrounds/dotted-line/2/water animated',0,150)
    addAnimationByPrefix('water', 'flowings', 'Symbol 1 instance 1',24,true)
    setScrollFactor('water',0.85,0.85)
setProperty('water.alpha',1)
    addLuaSprite('water',false)

    makeLuaSprite('shelf', 'backgrounds/dotted-line/2/background',0,0)
	setProperty('shelf.alpha',1)
    screenCenter('shelf','xy')
    addLuaSprite('shelf',false)

    makeAnimatedLuaSprite('plant', 'backgrounds/dotted-line/2/plant pot',20,-250)
    addAnimationByPrefix('plant', 'flow', 'plant pot instance 1',24,true)
    scaleObject('plant',0.9,0.9)
    addLuaSprite('plant',false)

    makeLuaSprite('chair', 'backgrounds/dotted-line/2/fucking chair',360,50)
	setProperty('chair.alpha',1)
    scaleObject('chair',0.8,0.8)
    addLuaSprite('chair',false)

    makeLuaSprite('add', 'backgrounds/dotted-line/2/sprite overlay use add blending mode too',-300,-200)
	setProperty('add.alpha',1)
    setBlendMode('add','add')
    addLuaSprite('add',true)

    makeAnimatedLuaSprite('force', 'backgrounds/dotted-line/2/one magic use add blending mode',350,300)
    addAnimationByPrefix('force', 'move', 'Magic Star instance 1',24,true)
    setBlendMode('force','add')
    scaleObject('force',0.8,0.8)
    addLuaSprite('force',true)
    -- 1
    makeAnimatedLuaSprite('swirl', 'backgrounds/dotted-line/1/swirl FUCK',0,-200)
    addAnimationByPrefix('swirl', 'wee', 'Symbol 10 instance 1',24,true)
    setProperty('swirl.alpha',1)
    setScrollFactor('swirl',0.9,0.9)
	screenCenter('swirl','x')
    addLuaSprite('swirl',false)

    for i = 1,5 do
    makeLuaSprite('star'..i..'', 'backgrounds/dotted-line/1/star',0,-125)
	setProperty('star'..i..'.alpha',0.9)
    setProperty('star1.color',getColorFromHex('F3AE69'))
    setProperty('star2.color',getColorFromHex('0011ff'))
    setProperty('star3.color',getColorFromHex('ff1900'))
    setProperty('star4.color',getColorFromHex('ff00d1'))
    setProperty('star5.color',getColorFromHex('00ff04'))
    setScrollFactor('star'..i..'',0.95,0.95)
    setBlendMode('star'..i..'','add')
    doTweenAlpha('stars'..i..'','star'..i..'',0,1.25)
    addLuaSprite('star'..i..'',true)
    end
    runTimer('starstuff',getRandomInt(2,5))
    star()

    makeLuaSprite('v', 'backgrounds/whos-there/vignette',0,0)
	setProperty('v.alpha',0)
    scaleObject('v',0.75,0.75)
	setObjectCamera('v','camHUD')
    addLuaSprite('v',false)
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end

    if (shadersEnabled) then
        initLuaShader("RGB_PIN_SPLIT");
        
        makeLuaSprite("temporaryShader");
        makeGraphic("temporaryShader", screenWidth, screenHeight);
        
        setSpriteShader("temporaryShader", "RGB_PIN_SPLIT");
        setShaderFloat('temporaryShader','amount',0.01)
        
        addHaxeLibrary("ShaderFilter", "openfl.filters");
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]]);
    end


    for _, backgroundsprite2 in ipairs({'sky','water','shelf','plant','chair','add','force'}) do
    setProperty(backgroundsprite2..'.visible',false)
end
    for _, background3 in ipairs({'skyb','ground','grass','grass2','grass3','grass4','land','grad'}) do
        setProperty(background3..'.visible',false)
end
    setProperty('swirl.visible',true)
end

function onEvent(tag,v1)
if tag == 'Trigger' and v1 == 'spookytween' then
    doTweenZoom('camGamesht3','camGame',2.051,2.75,'cubeInOut')
    doTweenAlpha('vshitend2','v',0.75,1,'cubeInOut')
elseif tag == 'Trigger' and v1 == 'pause' then
setProperty('canPause',true)
elseif tag == 'Trigger' and v1 == 'background2' then
    cancelTween('camGamesht3')
    cancelTween('vshitend2')
    setProperty('bfPhantom.visible',false)
    setProperty('bfPhantom2.visible',false)
    setProperty('dadPhantom.visible',false)
    setProperty('dadPhantom2.visible',false)
    setShaderFloat('temporaryShader','amount',0)
    for _, backgroundsprite2 in ipairs({'sky','water','shelf','plant','chair','add','force'}) do
        setProperty(backgroundsprite2..'.visible',true)
        setObjectOrder('dadGroup',getObjectOrder('chair')-1)
        setProperty('swirl.visible',false)
        for i = 1,5 do
        setProperty('star'..i..'.visible',false)
        end
setProperty('cameraSpeed',1)
        background1 = false
        background2 = true
    end

elseif tag == 'Trigger' and v1 == 'background3' then
    for _, background3 in ipairs({'skyb','ground','grass','grass2','grass3','grass4','land','grad'}) do
    setProperty(background3..'.visible',true)
    background3 = true
    background2 = false
    end
    for _, backgroundsprite2 in ipairs({'sky','water','shelf','plant','chair','add','force'}) do
        setProperty(backgroundsprite2..'.visible',false)
    end
    setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup')+2)
    setObjectOrder('grad',getObjectOrder('boyfriendGroup')+1)
    setProperty('camGame.zoom',1.5)
    doTweenZoom('camGamesht','camGame',0.751,1.25,'quintInOut')
    setProperty('defaultCamZoom',0.751)
    doTweenAlpha('vignetteendstuff','v',0.5,1,'quadOut')
    setProperty('isCameraOnForcedPos', true)
    setProperty('camFollow.x',610)
    setProperty('camFollow.y',310)
    --setProperty('dad.alpha',0)
    --setProperty('onep.alpha',1)
    --addAnimationByPrefix('onep', 'surprise', 'oneAPPEAR instance 1',24,false)
elseif tag == 'Trigger' and v1 == 'endtween' then
    doTweenZoom('camGamesht2','camGame',2.251,5.5,'cubeInOut')
    doTweenAlpha('vshitend','v',1,2,'cubeInOut')
end
end

function onTimerCompleted(tag)
if tag == 'starstuff' and background1 == true then
    star()
    runTimer('starstuff',getRandomInt(3,10))
end
end

function onTweenCompleted(tag)
if tag == 'camGamesht' then
setProperty('cameraSpeed',0)
end
end

function onSectionHit()
    if not mustHitSection and background2 == true then
        setProperty('defaultCamZoom',0.775)
        doTweenAlpha('fogshitoh','v',0.75,2,'quadOut')
    elseif mustHitSection and background2 == true then
        setProperty('defaultCamZoom',0.651)
        doTweenAlpha('fogshitoh2','v',0.35,0.5,'quadOut')
    end
    end


    --function onUpdatePost()
        --if getProperty('onep.animation.curAnim.finished') and getProperty("onep.animation.curAnim.name") == 'surprise' then
        --    setProperty('dad.alpha',1)
        --    setProperty('dad.y',-240)
        --    setProperty('dad.x',-150)
        --    setProperty('onep.visible',false)
        --    end
        --end



function star()
    for i = 1,5 do
    setProperty('star'..i..'.alpha',0.9)
    scaleObject('star'..i..'',getRandomInt(1,2),getRandomInt(1,2))
    doTweenAlpha('stars'..i..'','star'..i..'',0,1.25)
    doTweenAngle('starss'..i..'','star'..i..'',getRandomInt(90,360),2,'quadOut')
    setProperty('star'..i..'.x',getRandomInt(-530,1400))
    setProperty('star'..i..'.y',getRandomInt(-325,300))

    doTweenY('stary'..i..'','star'..i..'',200,getRandomInt(1.25,2.5),'quadOut')
    doTweenY('stary2'..i..'','star'..i..'.scale',0.5,2,'quadOut')

    doTweenX('starz'..i..'','star'..i..'',500,getRandomInt(1.5,3),'quadOut')
    doTweenX('starz2'..i..'','star'..i..'.scale',0.5,2,'quadOut')
end
end