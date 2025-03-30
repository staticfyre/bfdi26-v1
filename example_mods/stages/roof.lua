function onCreate() 
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

	makeLuaSprite('beam', 'backgrounds/wrongfinger/balance',-600,-200)
	setProperty('beam.alpha',1)
	setScrollFactor('beam',0.25,0.25)
	addLuaSprite('beam',false)

	makeLuaSprite('mount', 'backgrounds/vocalchords/teardropyoylemountain',-1550,-1450)
	setProperty('mount.alpha',1)
	setScrollFactor('mount',0.75,0.75)
	setProperty('mount.antialiasing',true)
	scaleObject('mount',3,3)
	addLuaSprite('mount',false)

	makeLuaSprite('fence','backgrounds/hey-two/fencing',-2925,750)
	addLuaSprite('fence')

	makeLuaSprite('floor','backgrounds/hey-two/flooringg',-1000,1000)
	addLuaSprite('floor')

-- characters
	makeAnimatedLuaSprite('l', 'backgrounds/hey-two/lightningbop',1500,425)
    setScrollFactor('l',0.975,0.975)
    addAnimationByPrefix('l', 'bop', 'lightningbop',24,true)
    addLuaSprite('l',false)

	makeAnimatedLuaSprite('td', 'backgrounds/hey-two/tbgbbopping',375,285)
    setScrollFactor('td',0.975,0.975)
    addAnimationByPrefix('td', 'bop', 'tbgbbop',24,true)
    addLuaSprite('td',false)

	makeAnimatedLuaSprite('y', 'backgrounds/hey-two/yellowfacebopper',2275,655)
    addAnimationByPrefix('y', 'bop', 'yellowfacebopper',24,true)
    addLuaSprite('y',false)

	makeAnimatedLuaSprite('g', 'backgrounds/hey-two/grassybop',1875,525)
    addAnimationByPrefix('g', 'bop', 'grassybop',24,true)
    addLuaSprite('g',false)

	makeAnimatedLuaSprite('gt', 'backgrounds/hey-two/gatybop',1275,775)
    addAnimationByPrefix('gt', 'bop', 'gatybop',24,true)
    addLuaSprite('gt',false)
--
makeLuaSprite('black', '', 0, 0)
setScrollFactor('black', 0, 0)
makeGraphic('black',1280,720,'60d5ff')
setProperty('black.alpha',0)
scaleObject('black',2,2)
addLuaSprite('black',false)
screenCenter('black', 'xy')

	makeLuaSprite('t', 'rendersnlogos/tworender',1300,50)
    setProperty('t.alpha',0)
	scaleObject('t',0.9,0.9)
    setObjectCamera('t','camHUD')
    addLuaSprite('t',false)

    makeAnimatedLuaSprite('logo', 'rendersnlogos/heytwotext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 9',24,true)
	scaleObject('logo',1.25,1.25)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

	makeLuaSprite('paper','backgrounds/eternal/paper',0,0)
	setBlendMode('paper','multiply')
	scaleObject('paper',2,2)
	setProperty('paper.visible',false)
		addLuaSprite('paper',true)
		setObjectCamera('paper','other')

		makeLuaSprite('transition', '',-1280,0);
makeGraphic('transition',1280,720,'000000')
addLuaSprite('transition',false);
setObjectCamera('transition', 'camHUD')
end