function onCreate()
	runTimer('blink',getRandomInt(3,10))
end

function onTimerCompleted(name)
	if name == 'blink' then
		runTimer('blink',getRandomInt(3,10))
		triggerEvent('Play Animation','blink','dad')
	end
end