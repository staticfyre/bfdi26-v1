function onCreate() 
	setProperty('camZooming',true)
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

	makeLuaSprite('boto','backgrounds/new-friendly/botobackground',-150,100)
	addLuaSprite('boto')

	makeLuaSprite('bt', 'rendersnlogos/botorender',1350,100)
    setProperty('bt.alpha',1)
    setObjectCamera('bt','camHUD')
	scaleObject('bt',0.65,0.65)
    addLuaSprite('bt',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/newfriendlytext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 1',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end
end