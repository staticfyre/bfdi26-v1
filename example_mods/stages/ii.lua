function onCreate() 
	setProperty('camGame.bgColor', getColorFromHex('93F8F0'))
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

makeLuaSprite('island','backgrounds/invitational/invitationalbg',0,0)
setProperty('island.alpha',1)
addLuaSprite('island',false)

makeLuaSprite('blue', '',3000,2380)
makeGraphic('blue',3280,30,'37c9fa')
setProperty('blue.alpha',0)
addLuaSprite('blue',false)

makeLuaSprite('m', 'rendersnlogos/mephonerender',1250,50)
setProperty('m.alpha',0)
scaleObject('m',0.35,0.35)
setObjectCamera('m','camHUD')
addLuaSprite('m',false)

makeAnimatedLuaSprite('logo', 'rendersnlogos/invitationaltext',0,0)
addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 7',24,true)
setProperty('logo.alpha',0)
scaleObject('logo',1.25,1.25)
setObjectCamera('logo','camHUD')
screenCenter('logo','xy')
addLuaSprite('logo',true)

makeLuaSprite('transition', '',-1280,0);
makeGraphic('transition',1280,720,'000000')
addLuaSprite('transition',false);
setObjectCamera('transition', 'camHUD')
end