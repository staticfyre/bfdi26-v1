function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
		setProperty('camGame.alpha',1)
		cameraFlash('camHUD', 'FFFFFF',0.5);
		setProperty('defaultCamZoom',1)
		setProperty('camZooming',true)
		doTweenAlpha('logoshit','logo',1,2,'quadOut')
		doTweenX('logoshit5','l',850,1.75,'circOut')
		doTweenAlpha('logoshit3','l',1,2,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenAlpha('logoshit2','logo',0,1,'quadOut')
		doTweenX('logoshit6','l',1250,2,'quadIn')
		doTweenAlpha('logoshit4','l',0,2,'quadOut')
	elseif name == 'Trigger' and v1 == 'cutscene-end' then
		doTweenAlpha('camhudactivate','camHUD',1,1.25,'quadOut')
		doTweenY('wrong','gf',getProperty('gf.y')+1125,1,'cubeInOut')
		doTweenAngle('wrong2','gf',45,3,'sineOut')
	end
	end