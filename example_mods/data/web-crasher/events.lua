function onEvent(name,v1)
if name == 'Trigger' and v1 == 'cutscene' then
	elseif name == 'Trigger' and v1 == 'hudcomein' then
	    for _, hudout in ipairs({'uiGroup','textmiss','iconP1Animated','iconP2Animated','scoreTxt','hyper','textacc','bars'}) do
		doTweenAlpha('comeback'..hudout..'',hudout,1,1,'quadOut')
				end
				for i = 0, 7 do
					noteTweenAlpha("Notealpha2"..i.."",i,1,1,'quadOut')
				end
	elseif name == 'Trigger' and v1 == 'speedshit' then
		setProperty('gf.visible',true)
		triggerEvent('Change Character','gf','hourgirl')
		setProperty('isCameraOnForcedPos',false)
		setProperty('cameraSpeed',2)
		doTweenColor('healthTween','healthBar.leftBar','FF0000',1.5)
		setProperty('canPause',true)
		setProperty('camGame.alpha',1)
		setProperty('defaultCamZoom',0.825)
	elseif name == 'Trigger' and v1 == 'badapple' then
setProperty('boyfriend.color',getColorFromHex('000000'))
setProperty('gf.color',getColorFromHex('000000'))
setProperty('dad.color',getColorFromHex('000000'))
	elseif name == 'Trigger' and v1 == 'badappleswap' then
		setShaderInt("temporaryShader2", "invert", 1)
	elseif name == 'Trigger' and v1 == 'badappleend' then
		setProperty('cameraSpeed',1000)
		setProperty('camGame.zoom',1.1)
		setProperty('defaultCamZoom',1.1)
		setShaderInt("temporaryShader2", "invert", 0)
		setProperty('boyfriend.color',getColorFromHex('FFFFFF'))
		setProperty('gf.color',getColorFromHex('FFFFFF'))
		setProperty('dad.color',getColorFromHex('FFFFFF'))
	elseif name == 'Trigger' and v1 == 'sparta' then
setProperty('camGame.visible',false)
setObjectCamera('gf','camHUD')
screenCenter('boyfriend','xy')
screenCenter('gf','xy')
setProperty('gf.y',getProperty('gf.y')+215)
setProperty("ytpmv.alpha",1)
setObjectOrder('ytpmv',getObjectOrder('boyfriendGroup')+5)
setObjectOrder('gfGroup',getObjectOrder('ytpmv')+5)
	elseif name == 'Trigger' and v1 == 'nosparta' then
		setProperty('camGame.visible',true)
		setObjectCamera('gf','camGame')
		setObjectCamera('dad','camGame')
		setObjectCamera('boyfriend','camGame')
		setProperty("ytpmv.alpha",0)
		setProperty('gf.y',getProperty('gf.y')+215)
		setProperty('gf.x',getProperty('gf.x')+210)
	elseif name == 'Trigger' and v1 == 'normal' then
		setProperty('cameraSpeed',2)
		setProperty('defaultCamZoom',0.825)
	elseif name == 'Trigger' and v1 == 'galaxy' then
		cameraFlash('camHUD', 'FFFFFF',1);
	doTweenAlpha('galaxystuff1','galaxy',1,1.5,'quadOut')
	elseif name == 'Trigger' and v1 == 'partytime' then
		setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup')+2)
		setObjectOrder('gfGroup',getObjectOrder('boyfriendGroup')-1)
		cameraFlash('camHUD', 'FFFFFF',1);
			runHaxeCode([[
		trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader3").shader))]);
game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader3").shader))]);
game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader3").shader))]);
	]])
elseif name == 'Trigger' and v1 == 'end' then
	cameraFlash('camOther', 'FFFFFF',1);
	end
	end