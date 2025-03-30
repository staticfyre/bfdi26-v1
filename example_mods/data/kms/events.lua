function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','p',1,2,'quadOut')
        doTweenX('logoshit5','p',800,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
        doTweenX('logoshit6','p',1500,2,'quadIn')
        doTweenAlpha('logoshit4','p',0,2,'quadOut')
elseif name == 'Trigger' and v1 == 'nutstart' then
        doTweenX('pussytween','puss',850,3.1,'linear')
elseif name == 'Trigger' and v1 == 'nutstop' then
        addAnimationByPrefix('puss', 'stop', 'nutty stop instance',24,false)
end
end
    function onUpdatePost()
        if getProperty('puss.animation.curAnim.finished') and getProperty("puss.animation.curAnim.name") == 'stop' then
                addAnimationByPrefix('puss', 'turn', 'nutty turn instance',24,false)
        elseif getProperty('puss.animation.curAnim.finished') and getProperty("puss.animation.curAnim.name") == 'turn' then
                addAnimationByPrefix('puss', 'stupid', 'nutty macarena instance',24,true)
                setProperty('puss.x',815)
        end
end