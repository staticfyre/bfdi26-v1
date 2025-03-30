function onEvent(name,v1)
if name == 'Trigger' and v1 == 'renderin' then
        setProperty('camGame.visible',true)
        setProperty('camHUD.visible',true)
        setProperty('camGame.filtersEnabled',true)
        doTweenAlpha('logoshit3','t',1,2,'quadOut')
        doTweenX('logoshit5','t',650,1.75,'circOut')
        doTweenAlpha('logoshit','logo',1,2,'quadOut')
elseif name == 'Trigger' and v1 == 'renderout' then
        doTweenX('logoshit6','t',1250,2,'quadIn')
        doTweenAlpha('logoshit4','t',0,2,'quadOut')
        doTweenAlpha('logoshit2','logo',0,2,'quadOut')
elseif name == 'Trigger' and v1 == 'fade' then
doTweenAlpha('backgroundbyebye','background',0.5,0.75,'circOut')
doTweenAlpha('backgroundbyebye2','sky',0.5,0.75,'circOut')
elseif name == 'Trigger' and v1 == 'beatbox' then
        setProperty('isCameraOnForcedPos', true)
        setProperty('defaultCamZoom',1.25)
	doTweenX('camX3', 'camFollow',getProperty('boyfriend.x')+120,1.65,'circOut')
	doTweenY('camY4', 'camFollow',getProperty('boyfriend.y')+75,1.75,'sine')
	doTweenZoom('camGamehihi2','camGame',getProperty('defaultCamZoom'),1.5,'circOut')
elseif name == 'Trigger' and v1 == 'endbeatbox' then
        setProperty('isCameraOnForcedPos',false)
        setProperty('defaultCamZoom',0.75)
        doTweenZoom('camGamehihi3','camGame',getProperty('defaultCamZoom'),0.65,'circOut')
        doTweenAlpha('backgroundbyebye3','background',1,0.75,'circOut')
doTweenAlpha('backgroundbyebye4','sky',1,0.75,'circOut')
elseif name == 'Trigger' and v1 == 'vaseEnter' then
doTweenX('vasewalk','v',2100,3)
addAnimationByPrefix('v', 'vwalk', 'walkvase',24,true)
elseif name == 'Trigger' and v1 == 'vaseYouch' then
addAnimationByPrefix('v', 'vow', 'Vaseow',24,false)
setProperty('v.x',getProperty('v.x')-100)
setProperty('v.y',getProperty('v.y')-150)
addAnimationByPrefix('w', 'wwalk', 'Wheelwalk',24,true)
doTweenX('wheelwalk','w',500,12.5)
elseif name == 'Trigger' and v1 == 'wheelRun' then
        doTweenX('wheell','wr',2450,10)
elseif name == 'Trigger' and v1 == 'sunAppear' then
        addAnimationByPrefix('s', 'sappear', 'Sunappear0',24,false)
        doTweenY('sunnysun','s',0,1.25,'quadOut')
elseif name == 'Trigger' and v1 == 'polkaAppear' then
        addAnimationByPrefix('p', 'pappear', 'Polkaappear',24,false)
        setProperty('p.visible',true)
elseif name == 'Trigger' and v1 == 'noEnter' then
        doTweenX('nowalk','n',1025,7.5)
        addAnimationByPrefix('n', 'nwalk', 'Nowalk',24,true)
elseif name == 'Trigger' and v1 == 'jumpscare' then
        addAnimationByPrefix('n', 'njump', 'Jumpscare',24,false)
        addAnimationByPrefix('s', 'sjump', 'Sunsurprise',24,false)
        setProperty('n.y',getProperty('n.y')-860)
        setProperty('n.x',getProperty('n.x')-350)
        setProperty('s.y',getProperty('s.y')-75)
	end
end

        function onTweenCompleted(tag)
        if tag == 'vasewalk' then
                addAnimationByPrefix('v', 'vnotice', 'Vasenotice',24,false)
        elseif tag == 'wheelwalk' then
                addAnimationByPrefix('w', 'wnotice', 'Wheelnotice',24,false)
        elseif tag == 'wheell' then
                removeLuaSprite('wr')
        elseif tag == 'nowalk' then
                addAnimationByPrefix('n', 'ndance', 'Nodance0',24,true)
        end
end

function onUpdatePost()
        if getProperty('v.animation.curAnim.finished') and getProperty("v.animation.curAnim.name") == 'vnotice' then
                addAnimationByPrefix('v', 'vdance', 'Vasedance0',24,true)
        elseif getProperty('v.animation.curAnim.finished') and getProperty("v.animation.curAnim.name") == 'vow' then
                addAnimationByPrefix('v', 'vdance2', 'Vasedance2',24,true)
                setProperty('v.x',getProperty('v.x')+100)
setProperty('v.y',getProperty('v.y')+150)
        elseif getProperty('w.animation.curAnim.finished') and getProperty("w.animation.curAnim.name") == 'wnotice' then
                addAnimationByPrefix('w', 'wdance', 'Wheeldance',24,true)
 setProperty('w.x',getProperty('w.x')+70)
setProperty('w.y',getProperty('w.y')+10)
elseif getProperty('s.animation.curAnim.finished') and getProperty("s.animation.curAnim.name") == 'sappear' then
        addAnimationByIndices('s','sdance','Sundance0','4,5,6,7,8,9,10,11,12,13,14',14,true)
elseif getProperty('p.animation.curAnim.finished') and getProperty("p.animation.curAnim.name") == 'pappear' then
        addAnimationByPrefix('p', 'pdance', 'Polkadance',24,true)
        setProperty('p.x',getProperty('p.x')+52.5)
setProperty('p.y',getProperty('p.y')+632.5)
elseif getProperty('n.animation.curAnim.finished') and getProperty("n.animation.curAnim.name") == 'njump' then
        addAnimationByPrefix('n', 'ndance2', 'Nodance2',24,true)
        addAnimationByIndices('s','sdance2','Sundance2','8,9,10,11,12,13,14',14,true)
        setProperty('n.y',getProperty('n.y')+850)
        setProperty('n.x',getProperty('n.x')+35)
        setProperty('s.y',getProperty('s.y')+75)
        end
end