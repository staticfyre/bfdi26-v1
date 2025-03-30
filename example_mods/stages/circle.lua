function onCreate() 
	setProperty('camGame.bgColor', getColorFromHex('FFFFFF'))
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

	makeLuaSprite('cc', 'circledie',0,0)
    setProperty('cc.alpha',0)
	scaleObject('cc',1.422,1.422)
    setObjectCamera('cc','other')
    addLuaSprite('cc',false)

	makeLuaSprite('c', 'rendersnlogos/circlerender',1000,50)
    setProperty('c.alpha',0)
    setObjectCamera('c','camHUD')
    addLuaSprite('c',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/wellroundedtext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 4',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end