function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'renderin' then
        setProperty('camGame.visible',true)
        setProperty('camHUD.visible',true)
        setProperty('camGame.filtersEnabled',true)
        doTweenAlpha('logoshit3','c',1,2,'quadOut')
        doTweenX('logoshit5','c',650,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','c',1250,2,'quadIn')
        doTweenAlpha('logoshit4','c',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
        elseif name == 'Trigger' and v1 == 'characterchange' then
                setProperty('isCameraOnForcedPos', true)
        doTweenY('daddie','dad',getProperty('dad.y')+750,1.25,'cubeInOut')
        doTweenY('bfdie','boyfriend',getProperty('boyfriend.y')+750,1.25,'cubeInOut')
        doTweenY('camY', 'camFollow',getProperty('camFollow.y')-500,1,'cubeInOut')
        doTweenZoom('camZoom','camGame',getProperty('defaultCamZoom')+0.35,1.25,'cubeInOut')
	end
	end

        function onTweenCompleted(tag)
        if tag == 'bfdie' then
                setProperty('isCameraOnForcedPos',false)
        doTweenZoom('camZoom2','camGame',getProperty('defaultCamZoom'),1.25,'cubeInOut')
        elseif tag == 'camY' then
                doTweenY('camY2', 'camFollow',getProperty('camFollow.y')+500,1,'cubeInOut') 
        end
end