function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','el',1,2,'quadOut')
        doTweenX('logoshit5','el',850,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','el',1450,2,'quadIn')
        doTweenAlpha('logoshit4','el',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
elseif name == 'Trigger' and v1 == 'onleafy' then
        speed = 3
        scaleObject('trees1',2,2)
        scaleObject('trees2',2,2)
        setScrollFactor('trees1',0.6,0.6)
        setScrollFactor('trees2',0.6,0.6)
    setProperty('floor.alpha',0)
    setProperty('floore.alpha',1)
    setProperty('v.alpha',0)
    setProperty('isCameraOnForcedPos',true)
    setProperty('dad.visible',false)
    setProperty('trees1.y',-1000)
    setProperty('trees2.y',-1080)
    setProperty('logo.visible',false)
elseif name == 'Trigger' and v1 == 'unleafy' then
        speed = 3
        scaleObject('trees1',1,1)
        scaleObject('trees2',1,1)
    setProperty('floor.alpha',1)
    setProperty('floore.alpha',0)
    setProperty('v.alpha',0.75)
    setProperty('isCameraOnForcedPos',true)
    setProperty('dad.visible',false)
    setProperty('trees2.y',-230)
    setProperty('trees1.y',-150)
    setScrollFactor('trees2',0.95,0.95)
    setScrollFactor('trees1',1,1)
end
end