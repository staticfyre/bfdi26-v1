camstop = nil

function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
		doTweenX('logoshit5','m',700,1.75,'circOut')
		doTweenAlpha('logoshit3','m',1,2,'quadOut')
		doTweenAlpha('logoshit','logo',1,3,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenX('logoshit6','m',1300,2,'quadIn')
		doTweenAlpha('logoshit4','m',0,2,'quadOut')
		doTweenAlpha('logoshit2','logo',0,1,'quadOut')
	elseif name == 'Trigger' and v1 == 'blueraid' then
	setProperty('island.alpha',0)
	setProperty('healthBar.alpha',0)
	setProperty('iconP1.alpha',0)
	setProperty('iconP2.alpha',0)
	setProperty('blue.alpha',1)
elseif name == 'Trigger' and v1 == 'unblueraid' then
	setProperty('island.alpha',1)
	setProperty('healthBar.alpha',1)
	setProperty('iconP1.alpha',1)
	setProperty('iconP2.alpha',1)
	setProperty('blue.alpha',0)
elseif name == 'Trigger' and v1 == 'move' then
	camstop = true
	setProperty('isCameraOnForcedPos',true)
	doTweenZoom('camgamezoom','camGame',1.25,1,'circOut')
	doTweenX('camX3', 'camFollow',getProperty('boyfriend.x')+300,0.2,'circOut')
doTweenY('camY4', 'camFollow',getProperty('boyfriend.y')+175,0.25,'circOut')
for i = 0,3 do
	noteTweenAlpha('strumdieokay'..i..'',i,0,1,'quadOut')
end
elseif name == 'Trigger' and v1 == 'unmove' then
	camstop = false
	setProperty('isCameraOnForcedPos',false)
	setProperty('camZooming',true)
	doTweenZoom('camgamezoom2','camGame',0.7,1,'circOut')
	for i = 0,3 do
		noteTweenAlpha('strumdieokay2'..i..'',i,1,1,'quadOut')
	end
	elseif name == 'Transition' then
		setProperty('transition.x',-1280)
		doTweenX('part1', 'transition',0,v1, 'linear')
	end
	end

		function onTweenCompleted(tag)
			if tag == 'part1' then
				doTweenX('transitiondie','transition',1280,0.175)
			end
			end

			function onUpdatePost()
			if camstop == true then
			setProperty('camZooming',false)
			end
		end