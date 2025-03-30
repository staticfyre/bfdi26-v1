local thecamzoom = false

function onStepHit()
if curStep == 32 then
	thecamzoom = true
elseif curStep == 256 then
	for p= 4,7 do
		noteTweenX('movePlayer'..p, p,415 + (110 *(p - 4)), 1.25,'quadInOut')
	doTweenY('camY5','camFollow',getProperty('dad.y')+725,1.5,'cubeInOut')
	setProperty('defaultCamZoom',1)
	doTweenAlpha('rainbowgoaway','rainbow',0,1)
	doTweenAlpha('rainbowgoaway2','rainbow2',0,1)
	end
elseif curStep == 384 then
	setProperty('defaultCamZoom',0.7)
	doTweenY('camY7', 'camFollow',getProperty('dad.y')+125,2.5,'cubeInOut')
	doTweenAlpha('rainbowgoaway3','rainbow',0.02,5)
	doTweenAlpha('rainbowgoaway4','rainbow2',0.02,5)
elseif curStep == 480 then
	setProperty('defaultCamZoom',0.8)
elseif curStep == 496 then
	setProperty('defaultCamZoom',0.9)
elseif curStep == 512 then
	setProperty('defaultCamZoom',1)
elseif curStep == 540 or curStep == 732 then
    doTweenX('trans', 'fade',0, 0.25, 'linear')
elseif curStep == 544 then
	setProperty('defaultCamZoom',0.675)
	startTween('trans2', 'fade', {x = 1280}, 0.249,{startDelay = 0.01})
elseif curStep == 636 then
	startTween('zoom', 'camGame', {zoom = 1}, 0.35,{startDelay = 0.4,ease = 'cubeInOut'})
	startTween('angle', 'camGame', {angle = 360}, 0.95,{ease = 'cubeInOut'})
elseif curStep == 640 then
	setProperty('airyp.alpha',1)
doTweenAlpha('airypfade','airyp',0,1.25)

	setShaderInt("temporaryShader", "invert", 1)
	cameraFlash('camHUD', '000000',1);

	setObjectCamera('fade','camHUD')
	setProperty('fade.x',-1280)
elseif curStep == 688 then
	setProperty('bfp.alpha',1)
doTweenAlpha('bfpfade','bfp',0,1.5)
elseif curStep == 724 then
	setProperty('gfp.alpha',1)
doTweenAlpha('gfpfade','gfp',0,2)
elseif curStep == 736 then
	setProperty('defaultCamZoom',0.725)
startTween('trans2', 'fade', {x = 1280}, 0.249,{startDelay = 0.01})
elseif curStep == 992 then
	startTween('zoom2', 'camGame', {zoom = 1},15,{ease = 'cubeInOut'})
	setProperty('defaultCamZoom',1)
	thecamzoom = false
elseif curStep == 1120 then
	startTween('zoom3', 'camGame', {zoom = 0.7},22.5,{ease = 'cubeInOut'})
	setProperty('defaultCamZoom',0.5)
end
end

function onUpdatePost()
if thecamzoom == false then
	setProperty('camZooming',false)
else
	setProperty('camZooming',true)
end
end

function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'oneshotstart' then
		setProperty('r.visible',false)
		setProperty('plane.visible',false)
		setProperty('glow.visible',false)
		setProperty('chairs.visible',false)
		setProperty('rainbow.visible',false)
		setProperty('rainbow2.visible',false)

		setProperty('white.visible',true)
		setProperty('black.visible',true)

		setProperty('iconP1.visible',false)
		setProperty('iconP2.visible',false)
		setProperty('healthBar.visible',false)

		setProperty('bfPhantom.alpha',0)
		setProperty('dadPhantom.alpha',0)
	elseif name == 'Trigger' and v1 == 'oneshotend' then
		setShaderInt("temporaryShader", "invert", 0)

		setProperty('r.visible',true)
		setProperty('plane.visible',true)
		setProperty('glow.visible',true)
		setProperty('chairs.visible',true)
		setProperty('rainbow.visible',true)
		setProperty('rainbow2.visible',true)

		setProperty('white.visible',false)
		setProperty('black.visible',false)

		setProperty('iconP1.visible',true)
		setProperty('iconP2.visible',true)
		setProperty('healthBar.visible',true)

		setProperty('bfPhantom.alpha',0.35)
		setProperty('dadPhantom.alpha',0.35)
	elseif name == 'Trigger' and v1 == 'renderin' then
		doTweenAlpha('logoshit3','a',1,2,'quadOut')
		doTweenX('logoshit5','a',700,1.75,'circOut')
		doTweenAlpha('logoshit','logo',1,2,'quadOut')
	elseif name == 'Trigger' and v1 == 'renderout' then
		doTweenX('logoshit6','a',1250,2,'quadIn')
		doTweenAlpha('logoshit4','a',0,2,'quadOut')
		doTweenAlpha('logoshit2','logo',0,2,'quadOut')
	end
end