function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        doTweenAlpha('logoshit3','1',1,1.3,'quadOut')
        doTweenAlpha('logoshit7','f',1,1.3,'quadOut')
        doTweenX('logoshit5','1',800,1.3,'circOut')
        doTweenY('logoshit8','f',0,1.3,'circOut')
        doTweenAlpha('logoshit','logo',1,1.3,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','1',1350,2,'quadIn')
        doTweenY('logoshit9','f',500,2,'quadIn')
        doTweenAlpha('logoshit4','1',0,2,'quadOut')
        doTweenAlpha('logoshit10','f',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
end
end