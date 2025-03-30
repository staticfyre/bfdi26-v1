function onCreate()
	runTimer('blink',getRandomInt(1,10))
end

function onTimerCompleted(name)
	if name == 'blink' and getProperty("dad.animation.curAnim.name") == 'idle' then
		runTimer('blink',getRandomInt(1,10))
		triggerEvent('Play Animation','blink','dad')
	else
		runTimer('blink',getRandomInt(1,10))
	end
end