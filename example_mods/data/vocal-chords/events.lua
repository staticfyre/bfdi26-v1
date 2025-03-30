	function onStepHit()
	if curStep == 256 then
	setProperty('camZooming',true)
	setProperty('defaultCamZoom',0.775)
	elseif curStep == 512 then
	doTweenAlpha('groundgo','ground',0,27,'quadOut')
	doTweenAlpha('treego','trees',0,27,'quadOut')
	doTweenAlpha('mountgo','mount',0,27,'quadOut')
	doTweenAlpha('skygo','beam',0,27,'quadOut')
	elseif curStep == 784 then
		doTweenAlpha('groundgo2','ground',1,0.625,'quadOut')
	doTweenAlpha('treego2','trees',1,0.725,'quadOut')
	doTweenAlpha('mountgo2','mount',1,0.725,'quadOut')
	doTweenAlpha('skygo2','beam',1,0.725,'quadOut')
	end
end

function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
		doTweenX('logoshit5','t',150,1.75,'circOut')
		doTweenAlpha('logoshit3','t',1,2,'quadOut')
		doTweenAlpha('logoshit','logo',1,3,'quadOut')
		doTweenAlpha('yshit','texty',1,3,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenX('logoshit6','t',700,2,'quadIn')
		doTweenAlpha('logoshit4','t',0,2,'quadOut')
		doTweenAlpha('logoshit2','logo',0,1,'quadOut')
		doTweenAlpha('yshit2','texty',0,1,'quadOut')
	end
	end