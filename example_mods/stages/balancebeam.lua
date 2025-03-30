function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
	setProperty('camGame.alpha',0)
	setProperty('camHUD.alpha',0)
	-- background shit

	makeLuaSprite('beam', 'backgrounds/wrongfinger/balance',-600,50)
	setProperty('beam.alpha',1)
	setScrollFactor('beam',1,1)
	addLuaSprite('beam',false)

	makeLuaSprite('l', 'rendersnlogos/leafyrender',1250,-200)
	setProperty('l.alpha',0)
	scaleObject('l',0.9,0.9)
	setObjectCamera('l','camHUD')
    addLuaSprite('l',true)

	makeAnimatedLuaSprite('logo', 'rendersnlogos/wrongfingertext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 5',24,true)
	scaleObject('logo',1.25,1.25)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end

function onCreatePost()
setObjectCamera('gf','other')
screenCenter('gf','xy')
setProperty('gf.x',75)
setProperty('gf.y',400)
end

function onSongStart()
    setProperty('isCameraOnForcedPos', true)
	doTweenX('camX3', 'camFollow',getProperty('dad.x')+475,6.5,'cubeInOut')
	doTweenY('camY4', 'camFollow',getProperty('dad.y')+150,7.5,'cubeInOut')
end