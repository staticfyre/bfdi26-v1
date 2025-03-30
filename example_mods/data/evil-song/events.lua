function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','l',1,2,'quadOut')
        doTweenX('logoshit5','l',650,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
        doTweenX('logoshit6','l',1350,2,'quadIn')
        doTweenAlpha('logoshit4','l',0,2,'quadOut')
end
end