local start = false

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if not isSustainNote and start == true then
	triggerEvent('Screen Shake','0.1,0.0025','0.1,0.0025')
	for strumLieNotes = 0,3 do
		if getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle')-3 and getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') +3 then
		 noteTweenAngle('glitchNoteAngle'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') + math.random(-2,2),0.1,'quadInOut')
		 
	   elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') -3 then
		 noteTweenAngle('glitchNoteAngle'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') + math.random(1,2),0.1,'quadInOut')
		 
		 elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') +3 then
		noteTweenAngle('glitchNoteAngle'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') + math.random(-2,1),0.1,'quadInOut')
		 end 
		 
		 
	  if getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'x')-10 and getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'x')+10 then
	  noteTweenX('glitchNoteX'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') + math.random(-5,5),0.1,'quadInOut')
		 
	   elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') -10 then
		 noteTweenX('glitchNoteX'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') + math.random(4,5),0.1,'quadInOut')
		 
		 elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') +10 then
		noteTweenX('glitchNoteX'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') + math.random(-5,4),0.1,'quadInOut')
		 end
		 
		 if getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') -10 and getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') +10 then
	 noteTweenY('glitchNoteY'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') + math.random(-5,5),0.1,'quadInOut')
		 
		elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') < getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') -10 then
	   noteTweenY('glitchNoteY'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') + math.random(4,5),0.1,'quadInOut')
		 
	 elseif getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') > getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') +10 then
	 noteTweenY('glitchNoteY'..strumLieNotes, strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') + math.random(-5,4),0.1,'quadInOut')
end
end
end
end

function onEvent(name,v1)
	if name == 'Trigger' and v1 == 'yoylefake' then
	start = true
elseif name == 'Trigger' and v1 == 'oldback' then
	start = false
elseif name == 'Trigger' and v1 == 'lyrics' then
		start = true
	end
end