function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','c',1,2,'quadOut')
        doTweenX('logoshit5','c',750,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','c',1250,2,'quadIn')
        doTweenAlpha('logoshit4','c',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
elseif name == 'Trigger' and v1 == 'epictween' then
        doTweenZoom('camgamezoom','camGame',0.95,1,'circOut')
        doTweenX('camX3', 'camFollow',getProperty('dad.x')+750,0.2,'circOut')
	doTweenY('camY4', 'camFollow',getProperty('dad.y')+375,0.25,'circOut')
        cancelTween('camGamehihi2')
elseif name == 'Trigger' and v1 == 'zoomstart' then
setProperty('camZooming',true)
doTweenZoom('camgamezoom2','camGame',getProperty('defaultCamZoom'),1,'circOut')
cancelTween('camgamezoom')
cancelTween('camY4')
cancelTween('camX3')
setProperty('isCameraOnForcedPos',false)
elseif name == 'Trigger' and v1 == 'center' then
        setProperty('isCameraOnForcedPos',true)
        doTweenZoom('camgamezoom2','camGame',getProperty('defaultCamZoom')-0.2,3,'sineOut')
        setProperty('defaultCamZoom',getProperty('defaultCamZoom')-0.2)
        doTweenX('camX4', 'camFollow',4700,1,'sineOut')
	doTweenY('camY5', 'camFollow',2100,1,'sineOut')
end
end