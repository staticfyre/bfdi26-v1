local dad = false
local bf = false

function onCreatePost()
    makeLuaSprite("bg", null, 0, 478)
    makeGraphic("bg", 500, 32.5, '000000')
    screenCenter("bg", 'x')
    setObjectCamera("bg", 'Other')
    addLuaSprite("bg", true)
    setProperty("bg.alpha", 0)

	makeLuaText('textt', '',550,0,getProperty('bg.y') + 6)
	setObjectCamera('textt', 'Other')
	setProperty('textt.alpha',1)
	setTextFont('textt','Shag-Lounge.OTF')
	setTextSize('textt',35)
addLuaText('textt',false)
end

function onEvent(n,v1,v2)
	if n == 'Lyrics' then
		cancelTween('1bye')
		cancelTween('0bye')
		scaleObject('textt',1.05,1.05)
		setProperty('textt.alpha',1)
		runTimer('bye',1.25)
		setTextString('textt',v1)
		setProperty("bg.alpha", 0.6)
		setGraphicSize('bg', getProperty('textt.textField.textWidth')+35, getProperty('textt.textField.textHeight') + 20)
        screenCenter('bg', 'x')
		screenCenter('textt','x')
		doTweenX('texthahaha','textt.scale',1,0.5,'quadOut')
		doTweenY('texthahaha2','textt.scale',1,0.5,'quadOut')
	if v2 == 'dad' then
		setProperty('textt.color', getIconColor('dad'))
		doTweenColor('text0hi','textt','FFFFFF',1)
	dad = true
	bf = false
	elseif v2 == 'bf' then
		setProperty('textt.color', getIconColor('boyfriend'))
		doTweenColor('text0hi','textt','FFFFFF',1)
		dad = false
		bf = true
	end
	if v1 == '' then
		setProperty("bg.alpha",0)
		setTextString('textt',v1)
	end
end
end

function onTimerCompleted(tag)
if tag == 'bye' then
	doTweenAlpha('0bye','textt',0,0.5)
	doTweenAlpha('1bye','bg',0,0.5)
end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end