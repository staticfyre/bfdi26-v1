function onSongStart()
	doTweenZoom('camGamehihi2','camGame',getProperty('defaultCamZoom'),15,'cubeInOut')
end

function onCreate()
	doTweenZoom('camGamehihi','camGame',2,0.001)
	setProperty('isCameraOnForcedPos', true)
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

makeLuaSprite('bag','backgrounds/syskill/thanosbasicskybox',2150,825)
scaleObject('bag',2.5,2.5)
setScrollFactor('bag',0.7,0.7)
addLuaSprite('bag',false)

makeLuaSprite('back','backgrounds/syskill/Syskill3',2350,850)
scaleObject('back',2,2)
setScrollFactor('back',0.775,0.775)
addLuaSprite('back',false)

makeLuaSprite('floor','backgrounds/syskill/Syskill1',3100,1250)
scaleObject('floor',2,2)
addLuaSprite('floor',false)

makeLuaSprite('fg','backgrounds/syskill/Syskill2',3750,1450)
scaleObject('fg',2,2)
setScrollFactor('fg',1.15,1.15)
addLuaSprite('fg',true)

makeLuaSprite('c', 'rendersnlogos/carrotrender',1250,50)
setProperty('c.alpha',0)
setObjectCamera('c','camHUD')
scaleObject('c',0.85,0.85)
addLuaSprite('c',false)

makeAnimatedLuaSprite('logo', 'rendersnlogos/syskillTxt',0,0)
addAnimationByPrefix('logo', 'title', 'syskillTxt',24,true)
setProperty('logo.alpha',0)
scaleObject('logo',1.25,1.25)
setObjectCamera('logo','camHUD')
screenCenter('logo','xy')
addLuaSprite('logo',true)

makeLuaSprite('blue', '', 0, 0)
setScrollFactor('blue', 0, 0)
makeGraphic('blue', 3840, 2160, '001EFF')
addLuaSprite('blue', true)
setBlendMode('blue','add')
setProperty('blue.alpha', 0.025)
setObjectCamera('blue','other')
screenCenter('blue', 'xy')
end

function onCreatePost()
	setProperty('gf.visible',false)
	setProperty('dad.alpha',0)
end