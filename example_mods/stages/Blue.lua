function onCreate() 
	setProperty('camGame.bgColor', getColorFromHex('FFFFFF'))

	makeLuaSprite('b', 'rendersnlogos/bluegolfballrender',1350)
    setProperty('b.alpha',0)
	scaleObject('b',1.35,1.35)
    setObjectCamera('b','camHUD')
    addLuaSprite('b',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/bluegolfballtitle',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 13',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end