local acc = 0
local oneshot = getRandomInt(1,5)
local NAME = nil
local unlocked = false
iconevil = nil
local fourbythree = false
local font = 'Shag-Lounge.OTF'

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onSongStart()
    setProperty('timeTxt.visible',true)
    doTweenAlpha('timetxtdie','timeTxt',0.5,1)
    if fourbythree == false then
    doTweenX('time1','time',0,math.floor(songLength/992.5/getProperty('playbackRate')))
    doTweenX('timebar','time2',1270,math.floor(songLength/992.5/getProperty('playbackRate')))
    else
        doTweenX('time1','time',-320,math.floor(songLength/992.5/getProperty('playbackRate')))
    doTweenX('timebar','time2',950,math.floor(songLength/992.5/getProperty('playbackRate')))
end
end

function onCreate()
    setProperty('timeTxt.visible',false)
	setProperty('camGame.bgColor', getColorFromHex('000000'))
 --runHaxeCode([[FlxG.mouse.useSystemCursor = true;]])
	if checkFileExists("BFDI26/weeks/6.json") then
        unlocked = true
        else
        unlocked = false
        end
    
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
    setObjectCamera('mouse','other')
setProperty('skipCountdown',true)

makeLuaSprite('logojnj','hud/logojnj',1195,640)
    addLuaSprite('logojnj',true)
	setProperty('logojnj.alpha',0)
    setObjectCamera('logojnj','other')

    makeLuaSprite('logos','hud/logosacri',1195,640)
    addLuaSprite('logos',true)
	setProperty('logos.alpha',0)
    setObjectCamera('logos','other')

    makeLuaSprite('logojnjm','hud/logojnjm',1195,640)
    addLuaSprite('logojnjm',true)
	setProperty('logojnjm.alpha',0)
    setObjectCamera('logojnjm','other')

    makeLuaSprite('logom','hud/logomilk',1195,640)
    addLuaSprite('logom',true)
	setProperty('logom.alpha',0)
    setObjectCamera('logom','other')

    makeLuaSprite('logocheese','hud/logocheesy',1195,640)
    addLuaSprite('logocheese',true)
	setProperty('logocheese.alpha',0)
    setObjectCamera('logocheese','other')

    makeLuaSprite('logogreen','hud/logogreeny',1195,640)
    addLuaSprite('logogreen',true)
	setProperty('logogreen.alpha',0)
    setObjectCamera('logogreen','other')

    makeLuaSprite('logot','hud/logothanos',1195,640)
    addLuaSprite('logot',true)
	setProperty('logot.alpha',0)
    setObjectCamera('logot','other')

    makeLuaSprite('logoda','hud/logodays',1195,640)
    addLuaSprite('logoda',true)
	setProperty('logoda.alpha',0)
    setObjectCamera('logoda','other')

    makeLuaSprite('logod','hud/logoderp',1195,640)
    addLuaSprite('logod',true)
	setProperty('logod.alpha',0)
    setObjectCamera('logod','other')

    makeLuaSprite('logoak','hud/logoAnko',1195,640)
    addLuaSprite('logoak',true)
	setProperty('logoak.alpha',0)
    setObjectCamera('logoak','other')

    makeLuaSprite('logoae','hud/logoepic',1195,640)
    addLuaSprite('logoae',true)
	setProperty('logoae.alpha',0)
    setObjectCamera('logoae','other')

    makeLuaSprite('logoomf','hud/logooomf',845,625)
    addLuaSprite('logoomf',true)
    scaleObject('logoomf',1.1,1.1)
	setProperty('logoomf.alpha',0)
    setObjectCamera('logoomf','other')

	makeLuaSprite('bars', 'hud/bars',0,0)
    setObjectCamera('bars','camHUD')
    setProperty('bars.alpha',0)
    addLuaSprite('bars',true)

    makeLuaText('textmiss', 'Votes: 0',1000,0,0)
    setProperty('textmiss.alpha',0)
    setTextBorder('textmiss',1.25,'000000')
    addLuaText('textmiss',true)

    makeLuaText('textacc', 'Acc: ?',1000,0,0)
    setProperty('textacc.alpha',0)
    setTextBorder('textacc',1.25,'000000')
    addLuaText('textacc',true)

    makeLuaSprite('time', '',-1280,710)
	makeGraphic('time',1280,10,'FF0000')
    setObjectCamera('time','camOther')
    setObjectOrder('time',getObjectOrder('uiGroup')-65)
	scaleObject('time',1,1)
	setProperty('time.alpha',1)
	addLuaSprite('time',true)

    makeLuaSprite('time2', 'hud/reddot',-15,702.5)
    setObjectCamera('time2','camOther')
    setObjectOrder('time2',getObjectOrder('uiGroup')-66)
	scaleObject('time2',0.5,0.5)
	setProperty('time2.alpha',1)
	addLuaSprite('time2',true)

if songName == 'yoylefake' then
NAME = 'BFDI 26: YOYLEFAKE'
setProperty('logojnj.alpha',0.5)
elseif songName == 'eternal' then
NAME = "FOUR'S ETERNAL ALGEBRA CLASS"
setProperty('logojnj.alpha',0.5)
iconevil = true
elseif songName == 'funny-fellow' then
    NAME = "Wow what a cool window! -Animatic"
    setProperty('logogreen.alpha',0.5)
elseif songName == 'wrong-finger' then
NAME = "BFDI 1a: Take the Plunge"
setProperty('logojnj.alpha',0.5)
iconevil = false
elseif songName == 'vocal-chords' then
NAME = "BFB 1: Getting Teardrop to Talk"
setProperty('logojnj.alpha',0.5)
iconevil = false
font = 'flareserif-821-bt-bold.TTF'
elseif songName == 'iloveamongus' then
NAME = "I'm killing myself"
elseif songName == 'oneshot' then
    NAME = "oh, uh. hi?"
    setProperty('logocheese.alpha',0.5)
    iconevil = false
            font = 'one.TTF'
elseif songName == 'time' then
    NAME = "IT'S TIME FOR THE [12:00] - This Friday Night!!"
    setProperty('logod.alpha',0.5)
    font = 'vcr.TTF'
    iconevil = false
elseif songName == 'web-crasher' then
    iconevil = false
        NAME = '"Pride preide pride rpurde pride! flag flag pride flaah g id there a limit to how long it can be"'
        setProperty('logoomf.alpha',0.5)
                font = 'impact.TTF'
        fourbythree = true
    elseif songName == 'well-rounded' then
        iconevil = false
            NAME = 'BFC 15: Circle'
            setProperty('logocheese.alpha',0.5)
                        font = 'Comic Sans MS.TTF'
    elseif songName == 'himsheys' then
        fourbythree = true
         NAME = "January 2009 - Firey's Candy Bar Adventure"
         iconevil = false
    elseif songName == 'invitational' then
        NAME =  "i would write a funny application window message here, but i'm a fat slob, so i didn't"
        setProperty('logoae.alpha',0.5)
        iconevil = false
        font = 'MarioLuigi2.TTF'
    elseif songName == 'new-friendly' then
        NAME =  "New Friendly!"
        setProperty('logoak.alpha',0.5)
        iconevil = false
    elseif songName == 'hey-two' then
        NAME =  "Hey two!"
        setProperty('logojnjm.alpha',0.5)
        font = 'TPOT.TTF'
        iconevil = false
    elseif songName == 'syskill' then
        NAME =  "april fools!"
        iconevil = false
        setProperty('logot.alpha',0.5)
    elseif songName == 'pls' then
        NAME =  "can i win pls"
        iconevil = false
        setProperty('logoda.alpha',0.5)
        font = 'SourceSans3-Black.TTF'
    elseif songName == 'evil-song' then
        setProperty('logos.alpha',0.5)
    NAME = '"MY SONG IS THE BEST AND PERFECT AS MY EVIL VILLIAN THEME SONG!"'
    iconevil = false
elseif songName == 'blue-golfball' then
            NAME =  "John BFDI 26"
    iconevil = false
elseif songName == 'dotted-line' then
    setProperty('logojnjm.alpha',0.5)
    NAME =  "don't forget to pay me back!"
            font = 'TPOT.TTF'
iconevil = false
elseif songName == 'kms' then
    setProperty('logom.alpha',0.5)
    NAME =  "oh my god..."
iconevil = false
elseif songName == 'whos-there' then
    NAME = 'anyone there?..'
font = 'flareserif-821-bt-bold.TTF'
setProperty('logojnj.alpha',0.5)
end
setPropertyFromClass('lime.app.Application', 'current.window.title',NAME)
end

function onCreatePost()
    setProperty('textacc.alpha',getProperty('textmiss.alpha'))

	setProperty('comboGroup.scollFactor.x',1.15)
	setProperty('comboGroup.scollFactor.y',1.15)

    setProperty('timeBar.visible',false)

    setTextSize('scoreTxt',25)
    setProperty('scoreTxt.x',250)
    setTextFont('scoreTxt',font)

    setTextSize('textmiss',25)
    setObjectOrder('textmiss',getObjectOrder('uiGroup')+1)
    setTextFont('textmiss',font)

    setTextSize('textacc',25)
    setObjectOrder('textacc',getObjectOrder('uiGroup')+5)
    setTextFont('textacc',font)

    setProperty('textmiss.x',-100)

screenCenter('textacc','x')

setTextFont('botplayTxt',font)
setTextFont('timeTxt',font)
setProperty('timeTxt.x',-100)
setProperty('timeTxt.y',665)
setTextSize('timeTxt',25)
setObjectCamera('timeTxt','other')

if font == 'TPOT.TTF' then
    setTextSize('textacc',35)
    setTextSize('textmiss',40)
    setTextSize('scoreTxt',40)
    setTextSize('timeTxt',45)
    setProperty('timeTxt.y',645)
end

    if downscroll then
		setProperty('scoreTxt.y',110)
        setProperty('textmiss.y',110)
	else
		setProperty('scoreTxt.y',660)
        setProperty('textmiss.y',660)
	end

    setProperty('textacc.y',getProperty('textmiss.y')+5)
end
function onUpdatePost()
    setTextString('timeTxt', formatTime(getSongPosition() - noteOffset) .. ' / ' .. formatTime(songLength))

        songPos = getSongPosition()
        if iconevil == true then
        doTweenY('iconmove','iconP2',(getProperty('iconP2.y'))-0.2*math.sin((songPos/1500) * (bpm/60) *0.75),0.01)
    setProperty('iconP2.x', getProperty('iconP2.x')+math.random(-10, 10))
        end

    if (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logojnj.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@BFDI');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logojnjm.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@BFDI');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logogreen.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@gagofgreen9611');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logoae.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@AnimationEpic');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logocheese.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@CheesyHfj');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logod.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@derpadon');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logot.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@Highvan');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >650 and getMouseY('other') <697 and getMouseX('other') >1219 and getMouseX('other') <1271 and getProperty('logoak.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@Anko6theAnimator');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >650 and getMouseY('other') <697 and getMouseX('other') >869 and getMouseX('other') <917 and getProperty('logoomf.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@Melotakt');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logoda.alpha') == 0.5 then
        runHaxeCode([[FlxG.openURL('https://www.youtube.com/@daysduzkrak');]])
    elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logos.alpha') == 0.5 then
            runHaxeCode([[FlxG.openURL('https://www.youtube.com/@SacriStuff');]])
        elseif (mouseClicked('left') or mouseClicked('right')) and getMouseY('other') >655 and getMouseY('other') <706 and getMouseX('other') >1215 and getMouseX('other') <1275 and getProperty('logom.alpha') == 0.5 then
            runHaxeCode([[FlxG.openURL('https://www.youtube.com/@SteamedMilkStudio');]])
    end
end

function goodNoteHit()
	acc = round((getProperty('ratingPercent') * 100), 2)
	setPropertyFromClass('lime.app.Application', 'current.window.title',''..NAME..': SCORE:'..score..' VOTES:'..misses..' ACCURACY:'..acc..'%')
    setTextString('textacc','Acc: '..acc..'%')
end

function noteMiss()
    if bfName ~= "liy" or "liy-angy" then
	triggerEvent('Play Animation','miss','boyfriend')
    end
	setTextString('textmiss','Votes: '..misses..'')
    setTextString('textacc','Acc: '..acc..'%')
	acc = round((getProperty('ratingPercent') * 100), 2)
	setPropertyFromClass('lime.app.Application', 'current.window.title',''..NAME..': SCORE:'..score..' VOTES:'..misses..' ACCURACY:'..acc..'%')
	end

    function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
        n = math.pow(10, n or 0)
        x = x * n
        if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
        return x / n
      end

      function onEndSong()
        setPropertyFromClass('lime.app.Application', 'current.window.title','BFDI 26')
      end

function onGameOver()
    if oneshot == 1 and unlocked == false and songName == 'vocal-chords' or songName == 'well-rounded' or songName == 'web-crasher' or songName == 'funny-fellow' or songName == 'time' or songName == 'invitational' or songName == 'himsheys' or songName == 'hey-two' or songName == 'pls' or songName == 'evil-song' or songName == 'whos-there' then
        if oneShoted == false then
            loadSong('oneshot') 
        end
    end
end