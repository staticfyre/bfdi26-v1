function onStepHit()
if curStep == 32 then
	doTweenAlpha('hudstart','camHUD',1,2.25,'quadOut')
elseif curStep == 256 then
	cameraFlash('camHUD', 'FFFFFF',0.5);
	doTweenZoom('camGamehihi2','camGame',getProperty('defaultCamZoom'),0.001)
	setProperty('dad.visible',true)
	setProperty('iconP2.visible',true)
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
	doTweenAlpha('logoshit','logo',1,2,'quadOut')
	doTweenAlpha('logoshit3','f',1,2,'quadOut')
	doTweenX('logoshit5','f',900,1.75,'circOut')
	doTweenX('dadmovw','dad',getProperty('dad.x')+450,1.5,'quadOut')
	setProperty('camZooming',true)
	setProperty('textacc.alpha',1)
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',1)
	end
elseif curStep == 284 then
	doTweenX('logoshit6','f',1285,2,'quadIn')
	doTweenAlpha('logoshit2','logo',0,2,'quadOut')
	doTweenAlpha('logoshit4','f',0,2,'quadOut')
elseif curStep == 1823 then
	setProperty('defaultCamZoom',0.625)
elseif curStep == 2079 then
	doTweenX('dadmovw2','dad',getProperty('dad.x')-550,2,'quadIn')
	setProperty('defaultCamZoom',1)
	doTweenZoom('camGamehihi3','camGame',1,3,'cubeInOut')
	setProperty('camZooming',false)
end
end