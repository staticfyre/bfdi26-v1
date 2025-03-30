function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
		doTweenX('logoshit5','t',650,1.75,'circOut')
		doTweenAlpha('logoshit3','t',1,2,'quadOut')
		doTweenAlpha('logoshit','logo',1,2,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenX('logoshit6','t',1000,2,'quadIn')
		doTweenAlpha('logoshit4','t',0,2,'quadOut')
		doTweenAlpha('logoshit2','logo',0,1,'quadOut')
	elseif name == 'Transition' then
		setProperty('transition.x',-1280)
		doTweenX('part1', 'transition',0,v1, 'linear')
	end
	end

	function onTweenCompleted(tag)
		if tag == 'part1' then
			setProperty('black.alpha',1)
			setProperty('paper.visible',true)
			doTweenX('transitiondie','transition',1280,0.175)
		end
		end