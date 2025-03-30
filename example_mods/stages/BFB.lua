function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
	-- background shit

	makeLuaSprite('beam', 'backgrounds/wrongfinger/balance',-600,50)
	setProperty('beam.alpha',1)
	setScrollFactor('beam',1,1)
	addLuaSprite('beam',false)

	makeLuaSprite('mount', 'backgrounds/vocalchords/teardropyoylemountain',-1550,-1450)
	setProperty('mount.alpha',1)
	setScrollFactor('mount',0.75,0.75)
	setProperty('mount.antialiasing',true)
	scaleObject('mount',3,3)
	addLuaSprite('mount',false)

	makeLuaSprite('trees', 'backgrounds/vocalchords/teardroptrees',-1600,1025)
	setProperty('trees.alpha',1)
	scaleObject('trees',2,2)
	addLuaSprite('trees',false)

	makeLuaSprite('ground', 'backgrounds/vocalchords/teardropground',-1000,1450)
	setProperty('ground.alpha',1)
	setScrollFactor('ground',1,1)
	addLuaSprite('ground',false)

	makeLuaSprite('t', 'rendersnlogos/teardrop-portrait',700,0)
	setProperty('t.alpha',0)
	scaleObject('t',0.65,0.65)
	setObjectCamera('t','camHUD')
    addLuaSprite('t',true)

	makeAnimatedLuaSprite('logo', 'rendersnlogos/vocalchordstext',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

	makeLuaText('texty', 'You',1000,0,0)
    setProperty('texty.alpha',0)
    setTextSize('texty',55)
    setTextFont('texty','Shag-Lounge.OTF')
    addLuaText('texty',true)
    setProperty('texty.x',-200)
    setProperty('texty.y',175)
end

function onSectionHit()
if mustHitSection then
setProperty('gf.flipX',true)
else
	setProperty('gf.flipX',false)
end
end

function onCreatePost()
	setProperty('gf.flipX',true)
	for i = 0, 3 do
		j = (i + 4)

		iPos = _G['defaultPlayerStrumX'..i];
		jPos = _G['defaultOpponentStrumX'..i];
		if alreadySwapped then
				iPos = _G['defaultOpponentStrumX'..i];
				jPos = _G['defaultPlayerStrumX'..i];
		end
		noteTweenX('note'..i..'TwnX', i, iPos, 1.25, 'cubeInOut');
		noteTweenX('note'..j..'TwnX', j, jPos, 1.25, 'cubeInOut');
		if middlescroll == true then
			noteTweenX('note'..i..'TwnX',j,iPos, 1.25, 'cubeInOut');
			noteTweenX('note'..j..'TwnX',i,jPos, 1.25, 'cubeInOut');
		end
end
end

function onUpdatePost()
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

    setProperty('iconP1.x',P1Mult - 110)
    setProperty('iconP1.origin.x',240)
    setProperty('iconP1.flipX',true)
    setProperty('iconP2.x',P2Mult + 110)
    setProperty('iconP2.origin.x',-100)
    setProperty('iconP2.flipX',true)
    setProperty('healthBar.flipX',true)
	end