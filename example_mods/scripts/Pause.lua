local isCanPaused = true
local button = 1
local buttonMax = 5
local surprise = false
local extra = 0
local extrascale = 0
local pride = 0

function onCreate()
	precacheImage('pause/exit')
	precacheImage('pause/resume')
	precacheImage('pause/restart')
	precacheImage('pause/options')
	precacheImage('pause/originl')
	precacheImage('pause/logothing')
end



function onUpdatePost()
    if keyJustPressed('pause') and getProperty('canPause') == true then
        openCustomSubstate('Pause', true)
        pauseMusic = 'Pausemusic'
    end
end

function onPause()
    return Function_Stop
end

--other shit

function onGameOver()
    closeCustomSubstate('pauseMenu')
end

function onGameOverStart()
    isCanPaused = false
	closeCustomSubstate('pauseMenu')
end

function onSoundFinished(tag)
    if tag == pauseMusic then
        playSound(pauseMusic, 1, pauseMusic)
    end
end

function onCustomSubstateCreatePost(tag)
	if tag == 'Pause' then
		pride = getRandomInt(1,250)

		if pride == 1 then --and checkFileExists("BFDI26/weeks/8.json") == false then
		playSound('sad',1)
		end

		--if pride == 1 and checkFileExists("BFDI26/weeks/8.json") == false then
		--playSound('sad',1)
		--end

		button = 1
		playSound(pauseMusic, 0, pauseMusic)
        soundFadeIn(pauseMusic, 20, 0, 1)

		makeLuaSprite('fade', '', 0, 0)
        makeGraphic('fade', 1280, 720, '000000')
        setObjectCamera('fade', 'other')
        setProperty('fade.alpha', 0)
        addLuaSprite('fade', true)

		makeAnimatedLuaSprite('watchSpr', 'pause/original', 5,170)
		addAnimationByPrefix('watchSpr','watch','original',true,24)
		scaleObject('watchSpr',0.7,0.7)
        setObjectCamera('watchSpr', 'other')
        setProperty('watchSpr.alpha',1)
        addLuaSprite('watchSpr', true)
		
       	makeAnimatedLuaSprite('resumeSpr', 'pause/RESUME',-50,280)
		addAnimationByPrefix('resumeSpr','resume','resume',true,24)
		scaleObject('resumeSpr',0.7,0.7)
        setObjectCamera('resumeSpr', 'other')
        setProperty('resumeSpr.alpha',0.55)
        addLuaSprite('resumeSpr', true)

        makeAnimatedLuaSprite('restartSpr', 'pause/RESTART', -50,390)
		addAnimationByPrefix('restartSpr','restart','restart',true,24)
		scaleObject('restartSpr',0.7,0.7)
        setObjectCamera('restartSpr', 'other')
        setProperty('restartSpr.alpha', 0.55)
        addLuaSprite('restartSpr', true)

        makeAnimatedLuaSprite('optionsSpr', 'pause/OPTIONS', -50,500)
		addAnimationByPrefix('optionsSpr','options','options',true,24)
		scaleObject('optionsSpr',0.7,0.7)
        setObjectCamera('optionsSpr', 'other')
        setProperty('optionsSpr.alpha', 0.55)
        addLuaSprite('optionsSpr', true)

        makeAnimatedLuaSprite('exitToMenu', 'pause/EXIT', -50,610)
		addAnimationByPrefix('exitToMenu','exit','exit',true,24)
		scaleObject('exitToMenu',0.7,0.7)
        setObjectCamera('exitToMenu', 'other')
        setProperty('exitToMenu.alpha', 0.55)
        addLuaSprite('exitToMenu', true)

        doTweenAlpha('BGISFADING', 'fade', 0.5,1, 'quadOut')

	if songName == 'eternal' and pride ~= 1 then
		makeLuaSprite('player', 'pause/renders/LiyRender',1300,150)
		extra = 0

	elseif songName == 'yoylefake' and surprise == true then
		makeLuaSprite('dirtybubble', 'rendersnlogos/dirtybubblerender',1300,0)
		scaleObject('dirtybubble',1.265,1.265)
		setObjectCamera('dirtybubble', 'other')
		setProperty('dirtybubble.alpha',0)
		addLuaSprite('dirtybubble', true)
		doTweenX('dirtymove','dirtybubble',400,1,'cubeOut')
		doTweenAlpha('dirtyFADING', 'dirtybubble',1,1, 'quadOut')

		makeLuaSprite('player', 'pause/renders/blockyrender',1300,150)

	elseif songName == 'yoylefake' and surprise == false then
		makeLuaSprite('player', 'pause/renders/blockyrender',1300,150)

	elseif songName == 'time' and pride ~= 1 then
		makeLuaSprite('player', 'pause/renders/bfhatrenderclock',1300,25)
		extra = -190

	elseif songName == 'funny-fellow' or songName == 'invitational' and pride ~= 1 then
		makeLuaSprite('player', 'pause/renders/bfhatrender',1300,150)
		extra = 0

	elseif songName == 'wrong-finger' and pride ~= 1 then
		makeLuaSprite('player', 'pause/renders/pinrender',1300,0)
		extra = 0

	elseif songName == 'oneshot' and pride ~= 1 then
		makeLuaSprite('player', 'pause/renders/bfhatonerender',1300,150)
		extra = 0

	elseif songName == 'vocal-chords' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/bfhatvocalchordrender',1300,150)
	extra = -100

elseif songName == 'well-rounded' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/circlebfrender',1300,75)
	extra = -50

elseif songName == 'himsheys' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/bfhatoldrender',1300,75)
	extra = -250
elseif songName == 'blue-golfball' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/sourapplerender',1300,-75)
	extra = 50
	extrascale = 0.75

elseif songName == 'syskill' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/speakerrendersyskill',1300,75)
	extra = 0
	extrascale = 0.5

elseif songName == 'hey-two' or songName == 'whos-there' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/tpotbfrender',1300,75)
	extra = 0
	extrascale = 0.35

elseif songName == 'dotted-line' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/basketballrender',1300,-125)
	makeLuaSprite('player2', 'pause/renders/onerender',1200,-75)

	extra = 275
	extrascale = 0

elseif songName == 'new-friendly' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/partyhatrender',1300,75)
	extra = -200
	extrascale = 0.35
elseif songName == 'pls' or songName == 'evil-song' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/plsbfrender',1300,50)
	extra = -50
	extrascale = 0.35

elseif songName == 'kms' and pride ~= 1 then
	makeLuaSprite('player', 'pause/renders/apple render',1300,50)
	makeLuaSprite('player2', 'pause/renders/beanie render',1200,-25)
	extrascale = 0.1
	extra = 50


	elseif songName == 'web-crasher' or pride == 1 then
		makeAnimatedLuaSprite('player', 'rendersnlogos/prideRender',1300,50)
    addAnimationByPrefix('player', 'pridelag', 'pride redner0',24,true)
	extra = -250
	--runTimer('showstarts',3.5)
	end

	if songName == 'dotted-line' and pride ~= 1 then
		setObjectCamera('player2', 'other')
		setProperty('player2.alpha',0)
		scaleObject('player2',0.75+extrascale,0.75+extrascale)
        addLuaSprite('player2', true)
		doTweenX('playermove2','player2',125+extra,1,'cubeOut')
		doTweenAlpha('playerFADING2', 'player2',1,1, 'quadOut')
	elseif songName == 'kms' and pride ~= 1 then
		setObjectCamera('player2', 'other')
		setProperty('player2.alpha',0)
		scaleObject('player2',0.75+extrascale,0.75+extrascale)
        addLuaSprite('player2', true)
		doTweenX('playermove2','player2',425+extra,1,'cubeOut')
		doTweenAlpha('playerFADING2', 'player2',1,1, 'quadOut')
	end

        setObjectCamera('player', 'other')
		setProperty('player.alpha',0)
		scaleObject('player',0.75+extrascale,0.75+extrascale)
        addLuaSprite('player', true)
		doTweenX('playermove','player',665+extra,1,'cubeOut')
		doTweenAlpha('playerFADING', 'player',1,1, 'quadOut')

        makeLuaSprite('logo26', 'pause/logothing',400,490)
        setObjectCamera('logo26', 'other')
		scaleObject('logo26',0.25,0.25)
		setProperty('logo26.alpha',0.75)
        addLuaSprite('logo26', true)
        doTweenY('logobounce', 'logo26',500, 0.4, 'quadIn')

        makeLuaText('levelInfo', songName, 300, screenWidth - 330, 15)
		setTextFont('levelInfo','Shag-Lounge.OTF')
		setTextSize('levelInfo', 32)
		setTextAlignment('levelInfo', 'right')
		addLuaText('levelInfo')
		setObjectCamera('levelInfo', 'other')
		setProperty('levelInfo.alpha', 0)
		startTween('levelInfoTween', 'levelInfo', {alpha = 1, y = getProperty('levelInfo.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.3 * 2'})

		makeLuaText('diffInfo', difficultyName, 300, getProperty('levelInfo.x'), getProperty('levelInfo.y') + 40)
		setTextFont('diffInfo','Shag-Lounge.OTF')
		setTextSize('diffInfo', 32)
		setTextAlignment('diffInfo', 'right')
		addLuaText('diffInfo')
		setObjectCamera('diffInfo', 'other')
		setProperty('diffInfo.alpha', 0)
		startTween('diffInfoTween', 'diffInfo', {alpha = 1, y = getProperty('diffInfo.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.6 * 2'})

		makeLuaText('deathCount', 'Eliminations: ' .. getPropertyFromClass('states.PlayState', 'deathCounter'), 300, getProperty('diffInfo.x'), getProperty('diffInfo.y') + 40)
		setTextFont('deathCount','Shag-Lounge.OTF')
		setTextSize('deathCount', 32)
		setTextAlignment('deathCount', 'right')
		addLuaText('deathCount')
		setObjectCamera('deathCount', 'other')
		setProperty('deathCount.alpha', 0)
		startTween('deathCountTween', 'deathCount', {alpha = 1, y = getProperty('deathCount.y') + 5}, 0.4, {ease = 'quartInOut', startDelay = '0.8 * 2'})

		cameraFlash('camOther', '000000',0.5);
	end
end

function onTweenCompleted(tag)
	if tag == 'logobounce' then
		doTweenY('logobounce2', 'logo26',472,1, 'quadOut')
	end
	if tag == 'logobounce2' then
		doTweenY('logobounce', 'logo26',475, 0.75, 'quadIn')
	end
end

function onTimerCompleted(tag)
	if tag == 'showstarts' and songName ~= 'web-crasher' then
		if crashedWeb == false then 
			loadWebCrasher()   
		end
	end
end

function onCustomSubstateUpdate(tag)
	if tag == 'Pause' then

		if keyJustPressed('accept') then
		if button == 1 then
			if songName == 'yoylefake' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=ye_HKD_C5o0&list=PLlnQEnlHxeaGSrczyUcP8KkVF05QM-73b&index=26');]])
			elseif songName == 'eternal' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=5UqZqXhaRQw');]])
			elseif songName == 'wrong-finger' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=YQa2-DY7Y_Q');]])
			elseif songName == 'vocal-chords' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=m_7nnajnaI8');]])
			elseif songName == 'iloveamongus' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=veG7DBG_bTk');]])
			elseif songName == 'oneshot' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=cE2hd1mKDZM');]])
			elseif songName == 'time' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=kvHc3e87Bfw');]])
			elseif songName == 'web-crasher' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=X5cWdTN12Jc');]])
			elseif songName == 'well-rounded' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=wuvyMUxhoas');]])
			elseif songName == 'himsheys' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=3f20eXVi3b0&t=0s');]])
			elseif songName == 'funny-fellow' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=CjbUT7C5VY8');]])
			elseif songName == 'invitational' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=Zve3CVjFSww');]])
			elseif songName == 'hey-two' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=_LDFLwqXJXs');]])
			elseif songName == 'blue-golfball' then
				runHaxeCode([[FlxG.openURL('https://x.com/realCarykh/status/1710446358950543550');]])
			elseif songName == 'syskill' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=ubxd7HPKDQg');]])
			elseif songName == 'pls' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=Ts2r4NgJUh8');]])
			elseif songName == 'new-friendly' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=zLIkFOJ7cdU');]])
			elseif songName == 'evil-song' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=tw-EVHk3btQ');]])
			elseif songName == 'dotted-line' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=OEuYHlSMXMM');]])
			elseif songName == 'kms' then
				runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=_T4SZ29OZR0');]])
			end
		elseif button == 2 then
        		stopSound(pauseMusic)
        		deleteObjects()
    		elseif button == 3 then
        		stopSound(pauseMusic)
        		restartSong()
    		elseif button == 4 then
        		stopSound(pauseMusic)
        		runHaxeCode([[
   	 				import options.OptionsState;
  	  				import backend.MusicBeatState;
  	  				game.paused = true;
 	   				game.vocals.volume = 0;
  	  				MusicBeatState.switchState(new OptionsState());
  	  				if (ClientPrefs.data.pauseMusic != 'None') {
    	    			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), game.modchartSounds('pauseMusic').volume);
    	    			FlxTween.tween(FlxG.sound.music, {volume: 1}, 1);
      	    			FlxG.sound.music.time = game.modchartSounds('pauseMusic').time;
    	  			}
    				OptionsState.onPlayState = true;
				]])
    		elseif button == 5 then
				setPropertyFromClass('lime.app.Application', 'current.window.title','BFDI 26')
        		stopSound(pauseMusic)
        		exitSong()
    		end
        end

		if keyJustPressed('down') and button ~= buttonMax then
        	button = button + 1
        	playSound('scrollMenu', 1)
    	elseif keyJustPressed('down') and button == buttonMax then
        	button = 1
        	playSound('scrollMenu', 1)
    	elseif keyJustPressed('up') and button ~= 1 then
        	button = button - 1
        	playSound('scrollMenu', 1)
    	elseif keyJustPressed('up') and button == 1 then
        	button = buttonMax
        	playSound('scrollMenu', 1)
    	end

		if keyJustPressed('down') or keyJustPressed('up') then
		if button == 1 then
			setProperty('watchSpr.alpha',1)
        	    setProperty('resumeSpr.alpha', 0.55)
        	    setProperty('restartSpr.alpha', 0.55)
        	    setProperty('optionsSpr.alpha', 0.55)
        	    setProperty('exitToMenu.alpha', 0.55)

				cancelTween('watchLeft')
        		doTweenX('watchLeft', 'watchSpr', 5, 0.25, 'cubeOut')
				cancelTween('watchBack')

        		doTweenX('resumeBack', 'resumeSpr', -50, 0.25, 'cubeOut')
				doTweenX('restartBack', 'restartSpr', -50, 0.25, 'cubeOut')
        		doTweenX('optionsBack', 'optionsSpr', -50, 0.25, 'cubeOut')
        		doTweenX('exitBack', 'exitToMenu', -50, 0.25, 'cubeOut')
		elseif button == 2 then
			setProperty('watchSpr.alpha', 0.55)
        	    setProperty('resumeSpr.alpha', 1)
        	    setProperty('restartSpr.alpha', 0.55)
        	    setProperty('optionsSpr.alpha', 0.55)
        	    setProperty('exitToMenu.alpha', 0.55)

				cancelTween('resumeLeft')
        		doTweenX('resumeLeft', 'resumeSpr', 5, 0.25, 'cubeOut')
				cancelTween('resumeBack')

				doTweenX('restartBack', 'restartSpr', -50, 0.25, 'cubeOut')
        		doTweenX('optionsBack', 'optionsSpr', -50, 0.25, 'cubeOut')
        		doTweenX('exitBack', 'exitToMenu', -50, 0.25, 'cubeOut')
				doTweenX('watchBack', 'watchSpr', -50, 0.25, 'cubeOut')
        	elseif button == 3 then
				setProperty('watchSpr.alpha', 0.55)
        	    setProperty('resumeSpr.alpha', 0.55)
        	    setProperty('restartSpr.alpha', 1)
        	    setProperty('optionsSpr.alpha', 0.55)
        	    setProperty('exitToMenu.alpha', 0.55)

				cancelTween('restartLeft')
        		doTweenX('restartLeft', 'restartSpr', 5, 0.25, 'cubeOut')
				cancelTween('restartBack')
        		
        		doTweenX('resumeBack', 'resumeSpr', -50, 0.25, 'cubeOut')
        		doTweenX('optionsBack', 'optionsSpr', -50, 0.25, 'cubeOut')
        		doTweenX('exitBack', 'exitToMenu', -50, 0.25, 'cubeOut')
				doTweenX('watchBack', 'watchSpr', -50, 0.25, 'cubeOut')
        	elseif button == 4 then
				setProperty('watchSpr.alpha', 0.55)
        	    setProperty('resumeSpr.alpha', 0.55)
        	    setProperty('restartSpr.alpha', 0.55)
        	    setProperty('optionsSpr.alpha', 1)
        	    setProperty('exitToMenu.alpha', 0.55)

				cancelTween('optionsLeft')
        	   	doTweenX('optionsLeft', 'optionsSpr', 5, 0.25, 'cubeOut')
				   cancelTween('optionsBack')

				doTweenX('restartBack', 'restartSpr', -50, 0.25, 'cubeOut')
        		doTweenX('resumeBack', 'resumeSpr', -50, 0.25, 'cubeOut')
        		doTweenX('exitBack', 'exitToMenu', -50, 0.25, 'cubeOut')
				doTweenX('watchBack', 'watchSpr', -50, 0.25, 'cubeOut')
        	elseif button == 5 then
				setProperty('watchSpr.alpha', 0.55)
        	    setProperty('resumeSpr.alpha', 0.55)
        	    setProperty('restartSpr.alpha', 0.55)
        	    setProperty('optionsSpr.alpha', 0.55)
        	    setProperty('exitToMenu.alpha', 1)
        	    
				cancelTween('exitLeft')
				cancelTween('optionsBack')
				doTweenX('exitLeft', 'exitToMenu', 5, 0.25, 'cubeOut')

				doTweenX('restartBack', 'restartSpr', -50, 0.25, 'cubeOut')
        		doTweenX('resumeBack', 'resumeSpr', -50, 0.25, 'cubeOut')
        		doTweenX('optionsBack', 'optionsSpr', -50, 0.25, 'cubeOut')
				doTweenX('watchBack', 'watchSpr', -50, 0.25, 'cubeOut')

        	end
    	end
	end
end

function onCustomSubstateDestroy(tag)
	if tag == 'Pause' then
		if pride == 1 then   
			if crashedWeb == false then
				loadWebCrasher();
			end
		end   
	end
end

function deleteObjects()
	for _, sprite in ipairs({'fade', 'resumeSpr', 'restartSpr', 'optionsSpr', 'exitToMenu','watchSpr','logo26','player','dirtybubble','player2'}) do
		removeLuaSprite(sprite, true)
	end

	for _, text in ipairs({'levelInfo', 'diffInfo', 'deathCount'}) do
		removeLuaText(text, true)
	end
	closeCustomSubstate('Pause')
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
end

function onStepHit()
	if curStep == 384 and songName == 'yoylefake' then
		surprise = true
	end
end