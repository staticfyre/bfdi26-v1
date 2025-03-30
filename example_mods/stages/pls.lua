function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

makeLuaSprite('iwi','backgrounds/pls/iwiBACKG',3900,-1300)
addLuaSprite('iwi',false)

makeAnimatedLuaSprite('g', 'backgrounds/pls/purpleghostbg',4700,1725)
addAnimationByPrefix('g', 'bop', 'purple',24,true)
setScrollFactor('g',0.95,0.95)
addLuaSprite('g',false)

makeLuaSprite('ch', 'rendersnlogos/chezrender',1350,50)
setProperty('ch.alpha',0)
setObjectCamera('ch','camHUD')
addLuaSprite('ch',false)

makeAnimatedLuaSprite('logo', 'rendersnlogos/plstext',0,0)
addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 11',24,true)
setProperty('logo.alpha',0)
scaleObject('logo',1.25,1.25)
setObjectCamera('logo','camHUD')
screenCenter('logo','xy')
addLuaSprite('logo',true)
end