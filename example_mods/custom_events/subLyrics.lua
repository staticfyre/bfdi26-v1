local dad = false
local bf = false

function onCreatePost()
    makeLuaSprite("bg2", null, 0, 530)
    makeGraphic("bg2", 500, 32.5, '000000')
    screenCenter("bg2", 'x')
    setObjectCamera("bg2", 'Other')
    addLuaSprite("bg2", true)
    setProperty("bg2.alpha", 0)

	makeLuaText('textt2', '',550,0,getProperty('bg2.y') + 6)
	setObjectCamera('textt2', 'Other')
	setProperty('textt2.alpha',1)
	setTextFont('textt2','Shag-Lounge.OTF')
	setTextSize('textt2',27.5)
addLuaText('textt2',false)
end

function onEvent(n,v1,v2)
	if n == 'subLyrics' then
		cancelTween('1bye2')
		scaleObject('textt2',1.05,1.05)
		setProperty('textt2.alpha',1)
		runTimer('bye2',1.25)
		setTextString('textt2',v1)
		setProperty("bg2.alpha", 0.6)
		setGraphicSize('bg2', getProperty('textt2.textField.textWidth')+35, getProperty('textt2.textField.textHeight') + 20)
        screenCenter('bg2', 'x')
		screenCenter('textt2','x')
		doTweenX('texthahaha3','textt2.scale',1,0.5,'quadOut')
		doTweenY('texthahaha4','textt2.scale',1,0.5,'quadOut')
	if v2 == 'dad' then
		setProperty('textt2.color', getIconColor('dad'))
		doTweenColor('text0hi2','textt2','FFFFFF',1)
	dad = true
	bf = false
	elseif v2 == 'bf' then
		setProperty('textt2.color', getIconColor('boyfriend'))
		doTweenColor('text0hi2','textt2','FFFFFF',1)
		dad = false
		bf = true
	end
	if v1 == '' then
		setProperty("bg2.alpha",0)
		setTextString('textt2',v1)
	end
end
end

function onTimerCompleted(tag)
if tag == 'bye2' then
	doTweenAlpha('0bye2','textt2',0,0.5)
	doTweenAlpha('1bye2','bg2',0,0.5)
end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end