function onEvent(name,v1,v2)
	if name == 'flash' then
	local split = stringSplit(v1, ',')
	local camera = (split[1])
	local color = (split[2])
	cameraFlash(camera,color,v2)
	end
end