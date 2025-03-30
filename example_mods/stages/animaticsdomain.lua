local miniani = false

function onCreate()
	doTweenZoom('camGamehihi','camGame',1,0.001)
	setProperty('camHUD.alpha',0)
	-- background shit
	makeLuaSprite('bg', 'backgrounds/funnyfellow/animaticbg',-3000,-4700)
	setProperty('bg.alpha',1)
	setScrollFactor('bg',0.95,0.95)
	scaleObject('bg',1.25,1.25)
	addLuaSprite('bg',false)

	makeLuaSprite('f', 'rendersnlogos/animaticrender',1285,0)
	setProperty('f.alpha',1)
	scaleObject('f',0.65,0.65)
	setObjectCamera('f','camHUD')
    addLuaSprite('f',true)

	makeAnimatedLuaSprite('logo', 'rendersnlogos/funnyfellow',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3',16,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end

function onCreatePost()
	setProperty('dad.x',getProperty('dad.x')-450)
    setProperty('iconP2.visible',false)
	setProperty('dad.visible',false)
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end
end

function onStepHit()
if curStep == 1295 then
miniani = true
elseif curStep == 1823 then
	miniani = false
end
end

function onSectionHit()
if not mustHitSection and miniani == true then
	setProperty("camFollow.y",1450)
	setProperty('defaultCamZoom',0.85)
elseif mustHitSection and miniani == true then
	setProperty('defaultCamZoom',0.625)
end
end