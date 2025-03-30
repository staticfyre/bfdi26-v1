function onCreate() 
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

    makeLuaSprite('p1','backgrounds/kms/BG',0,400)
    addLuaSprite('p1',false)
    scaleObject('p1',1,1)
    setProperty('p1.alpha',1)

	makeLuaSprite('p', 'rendersnlogos/popcorn render',1500,50)
    setProperty('p.alpha',0)
    scaleObject('p',0.75,0.75)
    setObjectCamera('p','camHUD')
    addLuaSprite('p',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/fkms',0,0)
    addAnimationByPrefix('logo', 'title', 'text',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

    makeAnimatedLuaSprite('puss', 'backgrounds/kms/thisguyfuckingrocks',-5,840)
    addAnimationByPrefix('puss', 'stupid', 'nutty stroll instance',24,true)
    scaleObject('puss',1.75,1.75)
    addLuaSprite('puss',true)
end

function onCreatePost()
setObjectOrder('dadGroup',getObjectOrder('puss')-1)
end