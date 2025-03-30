local start = false
local focus = false
local popped = false

function onStartCountdown()
    if not allowCountdown and not seenCutscene and yoylefakeStart then
        startVideo('yoylefakeStart',true)
			setProperty('camHUD.alpha',0)
	setProperty('camGame.alpha',0)
        allowCountdown = true
        return Function_Stop
    end
end

function onSongStart()
	for i = 0,7 do
		if  not downscroll then
		noteTweenY('note'..i..'',i,-100,0.01,'linear')
		else
			noteTweenY('note'..i..'',i,700,0.01,'linear')
	end
end
	setProperty('camZooming',true)
	setProperty('camHUD.alpha',0)
	setProperty('camGame.alpha',0)
	setProperty('iconP1.visible',false)
	setProperty('iconP2.visible',false)
	setProperty('healthBar.visible',false)
	setProperty('camHUD.alpha',0)
	setProperty('camGame.alpha',0)
	setProperty('scoreTxt.visible',false)
	setProperty('botplayTxt.visible',false)

	setProperty('dad.x',getProperty('dad.x')+200)
	setProperty('boyfriend.x',getProperty('boyfriend.x')-200)
end


function get(p)
    return getProperty('camGame.'..p);
end

function onCreate()
	setProperty('camGame.bgColor', getColorFromHex('000000'))
	initLuaShader('void')
	initLuaShader('lava')
	-- background shit
	makeLuaSprite('h', 'backgrounds/yoylefake/happyness',-700,-200)
	scaleObject('h',2,2)
	setScrollFactor('h',0.15,0.15)
	setProperty('h.alpha',0)
	addLuaSprite('h',false)
	setSpriteShader('h','void')

	makeLuaSprite('bg3', 'backgrounds/yoylefake/fakeoutsky',500,770)
	scaleObject('bg3',0.9,0.9)
	setProperty('bg3.alpha',1)
	setScrollFactor('bg3',0.95,0.95)
	addLuaSprite('bg3',false)

	makeLuaSprite('bg4', 'backgrounds/yoylefake/fakeout',200,1370)
	scaleObject('bg4',1,1)
	setProperty('bg4.alpha',1)
	setScrollFactor('bg4',0.995,0.995)
	addLuaSprite('bg4',false)

	makeAnimatedLuaSprite('fire3', 'backgrounds/yoylefake/fire',-425,90)
    addAnimationByPrefix('fire3', 'flames', 'fire',20,true)
	scaleObject('fire3',1.5,1.5)
	setScrollFactor('fire3',0.5,0.5)
	setProperty('fire3.alpha',0)
	setProperty('fire3.visible',false)
	setBlendMode('fire3','add')
    addLuaSprite('fire3',false)

	makeLuaSprite('center', 'backgrounds/yoylefake/recovery',1000,100)
	setScrollFactor('center',0.6,0.6)
	setProperty('center.alpha',0)
	addLuaSprite('center',false)

	makeLuaSprite('center2', 'backgrounds/yoylefake/recovery',1500,100)
	setScrollFactor('center2',0.59,0.59)
	setProperty('center2.alpha',0)
	addLuaSprite('center2',false)

	makeAnimatedLuaSprite('michael', 'backgrounds/yoylefake/michael',1000,600)
	setScrollFactor('michael',0.75,0.75)
	addAnimationByPrefix('michael', 'bop', 'MICHAEL instance 1',24,true)
	scaleObject('michael',0.85,0.85)
	setProperty('michael.alpha',0)
	addLuaSprite('michael',false)

	makeLuaSprite('red', '',-50,1500)
	makeGraphic('red',3280,270,'D40202')
	scaleObject('red',1,1)
	setProperty('red.alpha',0)
	addLuaSprite('red',false)

	makeLuaSprite('table', 'backgrounds/yoylefake/table',1250,1400)
	setProperty('table.alpha',0)
	scaleObject('table',0.8,0.8)
	addLuaSprite('table',false)

	makeLuaSprite('platform', 'backgrounds/yoylefake/platform',830,1615)
	setProperty('platform.alpha',0)
	addLuaSprite('platform',false)

	makeLuaSprite('platform2', 'backgrounds/yoylefake/platform',1910,1615)
	setProperty('platform2.alpha',0)
	addLuaSprite('platform2',false)

	makeLuaSprite('center3', 'backgrounds/yoylefake/recovery',500,-500)
	setProperty('center3.alpha',0)
	scaleObject('center3',1.5,1.5)
	addLuaSprite('center3',true)

	makeAnimatedLuaSprite('fire', 'backgrounds/yoylefake/fire',-225,690)
    addAnimationByPrefix('fire', 'flames', 'fire',16,true)
	scaleObject('fire',1.5,1.5)
	setScrollFactor('fire',0.75,0.75)
	setProperty('fire.alpha',0)
	setProperty('fire.visible',false)
	setBlendMode('fire','add')
    addLuaSprite('fire',true)

	makeLuaSprite('d', 'rendersnlogos/dirtybubblerender',1000,175)
setProperty('d.alpha',0)
setObjectCamera('d','camHUD')
scaleObject('d',1.7,1.7)
addLuaSprite('d',false)

	makeAnimatedLuaSprite('fire2', 'rendersnlogos/ezzylogo',0,0)
    addAnimationByPrefix('fire2', 'flames2', 'ezzy',24,true)
	screenCenter('fire2','xy')
	setObjectCamera('fire2','camHUD')
	setProperty('fire2.alpha',0)
    addLuaSprite('fire2',false)

makeLuaText('text', 'BFDI 26: YOYLEFAKE',1000,625,650)
screenCenter('text','xy')
setProperty('text.alpha',0)
setTextSize('text',75)
setTextFont('text','Shag-Lounge.OTF')
setObjectCamera('text','other')
addLuaText('text',true)

	makeLuaSprite('black', '', 0, 0)
	setScrollFactor('black', 0, 0)
	makeGraphic('black',1280,720,'FF0000')
	setBlendMode('black','multiply')
	setProperty('black.alpha',0)
	setObjectCamera('black','other')
	scaleObject('black',2,2)
	addLuaSprite('black',true)
	screenCenter('black', 'xy')

	makeLuaSprite('border','',0,0)
    makeGraphic('border',215,1080,'000000')
    addLuaSprite('border',false)
    setObjectCamera('border','other')

    makeLuaSprite('border2','',1050,0)
    makeGraphic('border2',270,1080,'000000')
    addLuaSprite('border2',false)
    setObjectCamera('border2','other')

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1280,720,'ffffff')
	  setProperty('flash.alpha',0)
	setBlendMode('flash', 'add')
	setObjectCamera('flash', 'other')
screenCenter('flash','xy')
	addLuaSprite('flash', true);
end


	function onSectionHit(elapsed)
		if not mustHitSection and focus == true then
			setProperty('defaultCamZoom',0.575)
		elseif mustHitSection and focus == true then
			setProperty('defaultCamZoom',0.7)
		end
	end

	function onCreatePost()
            --luaDebugMode = true;
            if (shadersEnabled) then
				initLuaShader('rain',100);
        
				makeLuaSprite('rainShaderSpr');
				setSpriteShader('rainShaderSpr', 'rain');
				setShaderFloatArray('rainShaderSpr', 'uScreenResolution', {screenWidth, screenHeight});
				setShaderFloat('rainShaderSpr', 'uTime', 0);
				setShaderFloat('rainShaderSpr', 'uScale', screenHeight / 200);
				setShaderFloat('rainShaderSpr', 'uIntensity', 0);
            
                
                addHaxeLibrary("ShaderFilter", "openfl.filters");
                runHaxeCode([[
                    trace(ShaderFilter);
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("rainShaderSpr").shader)]);
                ]]);
            end
        end

		function onUpdatePost()
		if runHaxeCode([[FlxG.mouse.overlaps(dad) && FlxG.mouse.justPressed]]) and setProperty('dad.visible',true) and curStep >128 and curStep <2912 then
			popped = true
			cameraFlash('camOther','000000',1)
			setProperty('dad.visible',false)
			playSound('pop',0.5)
		endSong()
	end
			songPos = getSongPosition()
			if start == true then
			doTweenY('michaelmove','michael',getProperty('michael.y')-1.5*math.sin((songPos/1500) * (bpm/120) *0.75),0.01)
			doTweenAlpha('imthealpha','fire',0.55+0.15*math.sin((songPos/3000) * (bpm/30) *1),0.01)
			doTweenAlpha('imthealpha2','fire3',0.65+0.25*math.sin((songPos/4000) * (bpm/60) *1),0.01)
			end

			setShaderFloat('h','iTime',os.clock())

			setShaderFloat('temporaryShader','iTime',os.clock()*2)
			setShaderFloatArray('rainShaderSpr', 'uCameraBounds',
			{get('scroll.x') + get('viewMarginX'), -- left
			get('scroll.y') + get('viewMarginY'), -- top
			get('scroll.x') + (get('width') - get('viewMarginX')), -- right
			get('scroll.y') + (get('height') - get('viewMarginY'))} -- bottom
		);
		setShaderFloat('rainShaderSpr','uTime',os.clock())

		if start == false then
			setProperty('camHUD.zoom',0.7)
			elseif start == true then
				noteTweenX("NoteMove",0,795, 0.001)
				noteTweenX("NoteMovebb",1,1015, 0.001)
				noteTweenX("NoteMovebbb",2,1240, 0.001)
				noteTweenX("NoteMovebbbb",3,1450, 0.001)
		end
	end

function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'yoylefake' then
	start = true
	focus = true
	doTweenY('recoveryy','center',getRandomInt(1500,2000),getRandomInt(2,5),'quadIn')
	doTweenAngle('recoveryy2','center',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
	doTweenY('recoveryy4','center2',getRandomInt(1500,2000),getRandomInt(2,5),'quadIn')
	doTweenAngle('recoveryy5','center2',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
	doTweenY('recoveryy6','center3',getRandomInt(1500,2000),getRandomInt(2,5),'quadIn')
	doTweenAngle('recoveryy7','center3',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
	setShaderFloat('rainShaderSpr', 'uIntensity',0.24);
	setProperty('dirtybubble.visible',true)
	elseif name == 'Trigger' and v1 == 'oldback' then
		start = false
		focus = false

		setShaderFloat('rainShaderSpr', 'uIntensity',0);
		setProperty('center.alpha',0)
		setProperty('center2.alpha',0)
		setProperty('center3.alpha',0)
	elseif name == 'Trigger' and v1 == 'flashandstop' then
		start = true
	elseif name == 'Trigger' and v1 == 'backsturned' then
		setProperty('center.alpha',1)
		setProperty('center2.alpha',1)
		setProperty('center3.alpha',1)
		setSpriteShader('h','lava')
	end
end

function onTweenCompleted(tag)
	if tag == 'recoveryy' then
		cancelTween('recoveryy2')
		setProperty('center.angle',0)

		setProperty('center.y',100)
		setProperty('center.x',getRandomInt(-100,2400))
	doTweenY('recoveryy','center',getRandomInt(1500,2000),getRandomInt(2,5),'quadIn')
	doTweenAngle('recoveryy2','center',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
	elseif tag == 'recoveryy4' then
		cancelTween('recoveryy5')
		setProperty('center2.angle',0)

		setProperty('center2.y',100)
		setProperty('center2.x',getRandomInt(-100,2400))
	doTweenY('recoveryy4','center2',getRandomInt(1500,2000),getRandomInt(2,5),'quadIn')
	doTweenAngle('recoveryy5','center2',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
elseif tag == 'recoveryy6' then
	cancelTween('recoveryy7')
	setProperty('center3.angle',0)

	setProperty('center3.y',-500)
	setProperty('center3.x',getRandomInt(500,2500))
doTweenY('recoveryy6','center3',getRandomInt(1900,2300),getRandomInt(2,5),'quadIn')
doTweenAngle('recoveryy7','center3',getRandomInt(360,1080),getRandomInt(5,10),'cubeInOut')
	end
	end

	function onTimerCompleted(name)
	if name == 'endhaha' then
	exitSong()
	end
end

function onEndSong()
	if popped == false and yoylefakeStart then
	runHaxeCode([[FlxG.openURL('https://discord.gg/ZuuV2vMuTW');]])
end
end