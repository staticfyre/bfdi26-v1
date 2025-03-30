bopstuff = false

function onCreate()
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
	-- background shit

	makeLuaSprite('background', 'backgrounds/evil-song/evilbackground',-600,50)
	setScrollFactor('ackground',1,1)
	addLuaSprite('background',false)

	makeAnimatedLuaSprite('l', 'rendersnlogos/Limeyea',1000,0)
	addAnimationByPrefix('l', 'limey', 'Limey',24,true)
	setProperty('l.alpha',0)
	setObjectCamera('l','camHUD')
    addLuaSprite('l',true)

	makeAnimatedLuaSprite('logo', 'rendersnlogos/EVILsong',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 7',12,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)
end

function onCreatePost()
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

function onBeatHit()
if bopstuff == true then
	if curBeat % 2 == 0 then
		setProperty('camGame.angle',2)
		setProperty('camHUD.angle',2)
		setProperty('bars.angle',-1)
	doTweenAngle('camgamestuff','camGame',0,1,'circOut')
	doTweenAngle('camhudstuff','camHUD',0,1,'circOut')
	triggerEvent("Add Camera Zoom", 0.015 % 2, 0.075)
	elseif curBeat % 2 == 1 then
		setProperty('camGame.angle',-2)
		setProperty('camHUD.angle',-2)
		setProperty('bars.angle',1)
		doTweenAngle('camgamestuff','camGame',0,1,'circOut')
		doTweenAngle('camhudstuff','camHUD',0,1,'circOut')
		triggerEvent("Add Camera Zoom", 0.015 % 2, 0.075)
	end
end
end

function onEvent(n,v1)
if n == 'Trigger' and v1 == 'bop' then
bopstuff = true
elseif n == 'Trigger' and v1 == 'nobop' then
	bopstuff = false
	setProperty('camGame.angle',2)
	setProperty('camHUD.angle',2)
	setProperty('bars.angle',-1)
doTweenAngle('camgamestuff','camGame',0,1,'circOut')
doTweenAngle('camhudstuff','camHUD',0,1,'circOut')
doTweenAngle('barsstuff','bars',0,1,'circOut')
triggerEvent("Add Camera Zoom", 0.015 % 2, 0.075)
elseif n == 'Trigger' and v1 == 'bopdance' then
	cameraSetTarget('dad')
	setProperty('defaultCamZoom',1.65)
	triggerEvent('Play Animation','dance','dad')
elseif n == 'Trigger' and v1 == 'fade' then
	triggerEvent("Add Camera Zoom", 0.015 % 2, 0.075)
doTweenAlpha('camhuddie','camHUD',0,1,'quadOut')
end
end