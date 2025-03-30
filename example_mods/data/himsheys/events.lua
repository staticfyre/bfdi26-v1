function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
		setProperty('defaultCamZoom',0.8)
		doTweenX('logoshit5','f',450,1.75,'circOut')
		doTweenAlpha('logoshit3','f',1,2,'quadOut')
		doTweenAlpha('logoshit','logo',1,3,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenX('logoshit6','f',1000,2,'quadIn')
		doTweenAlpha('logoshit4','f',0,2,'quadOut')
		doTweenAlpha('logoshit2','logo',0,1,'quadOut')
	elseif name == 'Trigger' and v1 == 'sbwalk' then
	doTweenX('sbwalking','sb',1500,25)
	end
	end