amount = 0

function onCreate()
	makeLuaSprite('flash', '', 0, 0);
	setProperty('flash.visible',false)
	  addLuaSprite('flash',false);

	  makeLuaSprite('flashg', 'backgrounds/hey-two/addeffect', 0, 0);
		setProperty('flashg.alpha',0)
	  setBlendMode('flashg', 'add')
	  setObjectCamera('flashg', 'hud')
	  addLuaSprite('flashg')
end

function onEvent(n,v1,v2)
	if n == 'RGB' then
setProperty('flash.x',v1)
doTweenX('flasheffect','flash',v2,1.75,'cubeOut')
triggerEvent("Add Camera Zoom", 0.015 % 2, 0.0015)

setProperty('flashg.alpha',1)
doTweenAlpha('flTw','flashg',0,0.75,'linear')
end
end

function onUpdatePost()
	amount = getProperty('flash.x')
setShaderFloat('temporaryShader','amount',amount/75)
setShaderFloat('temporaryShader2','u_brightness',amount/2)
end