function onCreate()
	runTimer('blink',getRandomInt(1,20))
end

function onTimerCompleted(name)
		runTimer('blink',getRandomInt(1,20))
		triggerEvent('Play Animation','blink','gf')
	end