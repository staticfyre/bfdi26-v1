local start = false

function onStepHit()
	if curStep == 64 then
	doTweenColor('textness2','text','FF0000',5,'quadOut')
	elseif curStep == 112 then
		doTweenAlpha('start','camHUD',1,1.5,'quadOut')
		doTweenY('textbye','text',getProperty('text.y')+750,1.25,'cubeInOut')
		doTweenAngle('textbye2','text',45,3,'sineOut')
elseif curStep == 380 then
	doTweenAlpha('red','black',1,0.245,'quadOut')
	doTweenAlpha('bye6','bg3',0,0.245,'quadOut')
	doTweenAlpha('bye9','bg4',0,0.245,'quadOut')
elseif curStep == 625 then
	setProperty('defaultCamZoom',0.9)
end
end

function onEvent(name,v1)
if name == 'Trigger' and v1 == 'startstuff' then
setProperty('gf.alpha',0)

	setProperty('time.alpha',0)
	setProperty('time2.alpha',0)
	setProperty('defaultCamZoom',0.825)
	doTweenAlpha('textness','text',1,2,'quadOut')

elseif name == 'Trigger' and v1 == 'yoylefake' then
	iconevil = true
	setProperty('scoreTxt.visible',true)
	cancelTween('red')
	setProperty('time.alpha',1)
	setProperty('time2.alpha',1)
	setProperty('center.alpha',1)
	setProperty('center2.alpha',1)
	setProperty('center3.alpha',1)
	start = true
	runHaxeCode([[
		for (strum in game.opponentStrums)
		{
			strum.cameras = [game.camGame];
			strum.scrollFactor.set(1, 1);
		}
		for (note in game.unspawnNotes) 
		{
			if (!note.mustPress) {
				note.cameras = [game.camGame];
				note.scrollFactor.set(1, 1);
			} 
		};
	]])
	setProperty('iconP1.visible',true)
	setProperty('iconP2.visible',true)
	setProperty('healthBar.visible',true)

	setProperty('dad.x',getProperty('dad.x')-70)
	setProperty('boyfriend.x',getProperty('boyfriend.x')+75)

	setProperty('textmiss.alpha',1)
	setProperty('textacc.alpha',1)
	setProperty('black.alpha',0.25)
	setProperty('bars.alpha',1)
	setProperty('h.alpha',1)
	setProperty('table.alpha',1)
	setProperty('bg2.alpha',0)
	setProperty('bg.alpha',0)
	setProperty('bg3.alpha',0)
	setProperty('bg4.alpha',0)
	setProperty('michael.alpha',1)
	setProperty('red.alpha',0.75)

	setProperty('fire.visible',true)
	setProperty('fire3.visible',true)

	cameraFlash('camHUD', 'FF0000',1);
	doTweenZoom('camhudmove','camHUD',1,0.01)

	doTweenX('bordershit','border',getProperty('border.x')-250,0.5,'circOut')
	doTweenX('bordershit2','border2',getProperty('border2.x')+250,0.5,'circOut')
	for i = 4,7 do
		if not downscroll then
		noteTweenY('note2'..i..'',i,50,0.01,'linear')
		else
	noteTweenY('noteu2'..i..'',i,575,0.01,'linear')
	end
end
	for i = 0,3 do 
	if downscroll then
		noteTweenY("NoteMove223"..i.."",i,1695, 0.001)
	else
		noteTweenY("NoteMove223"..i.."",i,895, 0.001)
end
end
elseif name == 'Trigger' and v1 == 'renderin' then
	setProperty('camGame.alpha',1)
	cameraFlash('camHUD', 'FFFFFF', 0.5);
	doTweenAlpha('fire2logo','fire2',1,1.25,'quadOut')
	doTweenAlpha('logoshit3','d',1,2,'quadOut')
	doTweenX('logoshit5','d',500,1.75,'circOut')
elseif name == 'Trigger' and v1 == 'renderout' then
	doTweenX('logoshit6','d',1000,2,'quadIn')
	doTweenAlpha('logoshit2','logo',0,2,'quadOut')
	doTweenAlpha('logoshit4','d',0,2,'quadOut')
	doTweenAlpha('fire3logo','fire2',0,1.25,'quadOut')
elseif name == 'Trigger' and v1 == 'oldback' then
	setProperty('defaultCamZoom',0.9)
	cameraFlash('camGame','000000',1)

	setProperty('bg3.alpha',1)
	setProperty('bg4.alpha',1)
	setProperty('bg3.color',getColorFromHex('4D2B2E'))
	setProperty('bg4.color',getColorFromHex('4D2B2E'))

	setProperty('dad.x',getProperty('dad.x')+200)
	setProperty('dad.y',getProperty('dad.y')-30)
	setProperty('boyfriend.x',getProperty('boyfriend.x')-200)

	doTweenX('bordershit3','border',getProperty('border.x')+225,0.5,'sineOut')
	doTweenX('bordershit4','border2',getProperty('border2.x')-225,0.5,'sineOut')


	setProperty('textmiss.alpha',0)
	setProperty('textacc.alpha',0)
	setProperty('scoreTxt.visible',false)
	setProperty('h.alpha',1)
	setProperty('table.alpha',0)
	setProperty('bg2.alpha',0)
	setProperty('bg.alpha',0)
	setProperty('michael.alpha',0)
	setProperty('red.alpha',0)
	setProperty('bars.alpha',0)

	setProperty('fire.visible',false)
	setProperty('fire3.visible',false)

	setProperty('iconP1.visible',false)
	setProperty('iconP2.visible',false)
	setProperty('healthBar.visible',false)
	setProperty('time.visible',false)
	setProperty('time2.visible',false)

	for i = 0,3 do
		noteTweenAlpha("Notealpha5"..i.."",i,0,1.5,'quadOut')
	end

	for i = 4,7 do
		if  not downscroll then
		noteTweenY('note'..i..'',i,-100,0.01,'linear')
		else
			noteTweenY('note'..i..'',i,700,0.01,'linear')
	end
end
elseif name == 'Trigger' and v1 == 'yoylespook' then
	startTween('zoom2', 'camGame', {zoom = 0.625},10,{ease = 'cubeInOut'})
	setProperty('defaultCamZoom',0.625)

	setProperty('black.alpha',0.75)
	setProperty('bg3.alpha',0)

	doTweenAlpha('red2','black',0.25,0.945,'quadOut')
elseif name == 'Trigger' and v1 == 'flashandstop' then
	start = true
	setProperty('black.alpha',0)
	cameraFlash('camHUD','FFFFFF',1)
	doTweenZoom('camhudmove','camHUD',1,0.01)
	setProperty('camGame.alpha',0)

	doTweenX('bordershit','border',getProperty('border.x')-250,0.5,'circOut')
	doTweenX('bordershit2','border2',getProperty('border2.x')+250,0.5,'circOut')
	for i = 4,7 do
		if not downscroll then
		noteTweenY('note2'..i..'',i,50,0.01,'linear')
		else
	noteTweenY('noteu2'..i..'',i,575,0.01,'linear')
	end
end
elseif name == 'Trigger' and v1 == 'backsturned' then
	setProperty('isCameraOnForcedPos', true)
	doTweenX('camX3', 'camFollow',getProperty('boyfriend.x')+75,0.5,'cubeInOut')
	doTweenY('camY4', 'camFollow',getProperty('boyfriend.y')+100,2.5,'cubeInOut')

	setProperty('defaultCamZoom',1.35)

	setProperty('black.alpha',0.25)
	cameraFlash('camHUD','FF0000',1)
	setProperty('camGame.alpha',1)

	setProperty('bg3.alpha',0)
	setProperty('bg4.alpha',0)

	setProperty('textmiss.alpha',1)
	setProperty('textacc.alpha',1)
	setProperty('scoreTxt.visible',true)
	setProperty('bars.alpha',1)
	setProperty('h.alpha',1)

	setProperty('iconP1.visible',true)
	setProperty('iconP2.visible',true)
	setProperty('healthBar.visible',true)

	setProperty('fire.visible',false)
	setProperty('fire3.visible',false)

	setProperty('time.visible',true)
	setProperty('time2.visible',true)

	setProperty('dad.x',getProperty('dad.x')+830)
elseif name == 'Trigger' and v1 == 'dadfade' then
	doTweenAlpha('dadshitdie','dad',0,0.75,'quadOut')
	doTweenAlpha('dadshitdie2','h',0,0.75,'quadOut')
elseif name == 'Trigger' and v1 == 'redzoom' then
	cancelTween('dadshitdie')
	cancelTween('dadshitdie2')
	cameraFlash('camHUD','FF0000',1)
	setProperty('dad.alpha',1)
	setProperty('h.alpha',1)
	setProperty('defaultCamZoom',0.9)
	doTweenZoom('camGamehah','camGame',getProperty('defaultCamZoom'),1.5,'circOut')
	doTweenX('camX4', 'camFollow',getProperty('boyfriend.x')-175,1.5,'cubeInOut')
		doTweenY('camY5', 'camFollow',getProperty('boyfriend.y')+50,2.5,'cubeInOut')
		setProperty('dad.x',getProperty('dad.x')+630)
		setProperty('dad.y',getProperty('dad.y')-150)
		setProperty('red.alpha',0.5)
elseif name == 'Trigger' and v1 == 'blockylockin' then
	doTweenZoom('camGamehah','camGame',1.35,12)
	doTweenX('camX6', 'camFollow',getProperty('boyfriend.x')+100,12.5,'cubeInOut')
		doTweenY('camY8', 'camFollow',getProperty('boyfriend.y')+150,12.5,'cubeInOut')
elseif name == 'Trigger' and v1 == 'prelyrics' then
	cameraFlash('camHUD', 'FFFFFF',1);
	setProperty('camGame.alpha',0)
	doTweenAlpha('iconPDIE','iconP1',0,1.5,'quadOut')
	doTweenAlpha('iconPDIE2','iconP2',0,1.5,'quadOut')
	doTweenAlpha('HealthBardie','healthBar',0,1.5,'quadOut')
	doTweenAlpha('iconPDIE3','bars',0,1.5,'quadOut')
	doTweenAlpha('iconPDIE4','textmiss',0,1.5,'quadOut')
	doTweenAlpha('iconPDIE24','textacc',0,1.5,'quadOut')
	doTweenAlpha('iconPDIE34','scoreTxt',0,1.5,'quadOut')
	for i = 4,7 do
	noteTweenAlpha("Notealpha"..i.."",i,0,1.5,'quadOut')
	end
elseif name == 'Trigger' and v1 == 'fadebackin' then
	setProperty('defaultCamZoom',0.575)
	doTweenZoom('camGamehah','camGame',0.575,3)
	doTweenX('camX176', 'camFollow',getProperty('boyfriend.x')-400,3.5,'cubeInOut')
		doTweenY('camY178', 'camFollow',getProperty('boyfriend.y')+50,2.5,'cubeInOut')
		setProperty('red.alpha',0)
		setProperty('camGame.alpha',1)
		setProperty('canPause',true)

	doTweenAlpha('iconPDIE13','bars',1,1.5,'quadOut')
	doTweenAlpha('iconPDIE14','textmiss',1,1.5,'quadOut')
	doTweenAlpha('iconPDIE17','textacc',1,1.5,'quadOut')
	doTweenAlpha('iconPDIE18','scoreTxt',1,1.5,'quadOut')
	removeLuaScript('movecam')

	startTween('cutscenedie', 'myCutscene_video', {alpha = 0},2,{startDelay = 1.5,ease = 'sineOut'})
	for i = 0,7 do
		noteTweenAlpha("Notealpha22"..i.."",i,1,1.5,'quadOut')
		setProperty('platform2.alpha',1)
		setProperty('platform.alpha',1)

		setProperty('fire.visible',true)
		setProperty('fire3.visible',true)
		end
elseif name == 'Trigger' and v1 == 'lyrics' then
	cameraFlash('camOther', '000000',1);
setProperty('canPause',false)
elseif name == 'Trigger' and v1 == 'ending' then
	setProperty('defaultCamZoom',1.5)
doTweenZoom('camGamehah3','camGame',1.5,0.5)
doTweenX('camX7', 'camFollow',getProperty('dad.x')+100,0.35,'cubeInOut')
	doTweenY('camY9', 'camFollow',getProperty('dad.y')+200,0.5,'cubeInOut')
	doTweenAlpha('camHUDdie','camHUD',0,0.5)
	doTweenAlpha('camHUDdie2','flash',1,0.45)
elseif name == 'Trigger' and v1 == 'endingout' then
doTweenAlpha('camHUDdie3','flash',0,0.5)
setProperty('camGame.visible',false)

setProperty('camZooming',false)
setProperty('canPause',false)
setProperty('time.alpha',0)
setProperty('time2.alpha',0)
setProperty('timeTxt.alpha',0)
elseif name == 'dumb video' and v1 == 'yoylefake2' then
	setProperty('flash.visible', false)
	setProperty('camGame.visible', false)
	setProperty('camHUD.visible', false)
	setProperty('black.visible', false)
	setProperty('border.visible', false)
	setProperty('border2.visible', false)
	setProperty('timeTxt.visible', false)
end
end