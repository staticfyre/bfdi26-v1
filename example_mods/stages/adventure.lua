local cutscene = true
local start = 0
local clicked = false

function onStartCountdown()    
    if cutscene == true and start == 0 then
            return Function_Stop;
    end
end

function onCreate() 
	addLuaScript('data/customratio')

	makeLuaSprite('backgroundgame','backgrounds/himshey/candybarbackground',-775,50)
	scaleObject('backgroundgame',0.75,0.75)
	addLuaSprite('backgroundgame')

	makeLuaSprite('background','backgrounds/himshey/candybarbackdrop',-25,-25)
	setProperty('background.visible',true)
	setObjectCamera('background','other')
	addLuaSprite('background')

	makeLuaSprite('title','backgrounds/himshey/titleeeeeee',85,100)
	setProperty('title.visible',true)
	setObjectCamera('title','other')
	addLuaSprite('title')

	makeLuaSprite('button','backgrounds/himshey/play_button',150,500)
	setProperty('button.visible',true)
	setObjectCamera('button','other')
	addLuaSprite('button')

	makeLuaSprite('f', 'rendersnlogos/fireyrender',1000,50)
	scaleObject('f',0.35,0.35)
    setProperty('f.alpha',0)
    setObjectCamera('f','camHUD')
    addLuaSprite('f',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/himsheystext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 6',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

	makeLuaSprite('buttongraphic','',275,950)
    makeGraphic('buttongraphic',825,213,'FFFFFF')
    addLuaSprite('buttongraphic',false)
	setProperty('buttongraphic.visible',false)
    setObjectCamera('buttongraphic','other')

	makeAnimatedLuaSprite('match', 'backgrounds/himshey/matchbg',925,475)
    setScrollFactor('match',0.95,0.95)
    addAnimationByPrefix('match', 'bop', 'match',24,false)
    addLuaSprite('match',false)

	makeAnimatedLuaSprite('sb', 'backgrounds/himshey/snowballwalking',-480,855)
    setScrollFactor('sb',1.15,1.15)
	scaleObject('sb',0.85,0.85)
    addAnimationByPrefix('sb', 'walk', 'snowballs',24,true)
    addLuaSprite('sb',true)
end

function onUpdatePost()
	if runHaxeCode([[FlxG.mouse.overlaps(game.getLuaObject('buttongraphic'))]]) then
	doTweenX('buttonsize','button.scale',1.05,0.25,'circOut')
	doTweenY('buttonsize3','button.scale',1.05,0.25,'backOut')
	cancelTween('buttonsize2')
	cancelTween('buttonsize4')
	end
if not runHaxeCode([[FlxG.mouse.overlaps(game.getLuaObject('buttongraphic'))]]) then
		cancelTween('buttonsize')
		cancelTween('buttonsize3')
		doTweenX('buttonsize2','button.scale',1,0.25,'circOut')
		doTweenY('buttonsize4','button.scale',1,0.25,'backOut')
end
	if runHaxeCode([[FlxG.mouse.overlaps(game.getLuaObject('buttongraphic')) && FlxG.mouse.justPressed]]) and clicked == false then
		setProperty('skipCountdown',true)
		setProperty('buttongrahpic.y',1500)

		doTweenX('titlesize','title.scale',0,1.25,'circOut')
		doTweenY('titlesize2','title.scale',0,1.25,'backOut')

		doTweenAlpha('buttondie','button',0,1,'quadOut')
		
		cutscene = false
		clicked = true
		startTween('bgshit', 'background', {alpha = 0}, 0.5, {startDelay = 1.25,ease = 'quadOut'})
	startCountdown()
	return Function_Continue;
    end
end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('match','bop')
end
end