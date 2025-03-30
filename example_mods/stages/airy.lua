local createfile = false

function onSongStart()
    setProperty('isCameraOnForcedPos', true)
	doTweenX('camX3', 'camFollow',getProperty('dad.x')+475,2,'cubeInOut')
	doTweenY('camY4', 'camFollow',getProperty('dad.y')+150,3.5,'cubeInOut')
	doTweenZoom('camGamehihi2','camGame',getProperty('defaultCamZoom'),4.5,'cubeInOut')

	if createfile == true then
		saveFile('BFDI26/weeks/6.json',
[[{
			"storyName": "",
			"difficulties": "normal",
			"hideFreeplay": false,
			"weekBackground": "",
			"weekBefore": "",
			"freeplayColor": [
				146,
				113,
				253
			],
			"startUnlocked": true,
			"hideStoryMode": true,
			"songs": [
				[
					"oneshot",
					"airy",
					[
						55,
						20,
						0
					]
				]
			],
			"weekCharacters": [
				"dad",
				"bf",
				"gf"
			],
			"hiddenUntilUnlocked": false,
			"weekName": ""
	}]])
		end
end

function onCreate()
	setProperty('camZooming',false)

	if checkFileExists("BFDI26/weeks/6.json") then
	createfile = false
	else
	createfile = true
	end

	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)
	doTweenZoom('camGamehihi','camGame',4,0.001)
	initLuaShader('scroll')
	-- background shit
	makeLuaSprite('black', '',-500,750)
	makeGraphic('black',1280,720,'000000')
	scaleObject('black',2,2)
	setProperty('black.visible',false)
	addLuaSprite('black',false)

	makeLuaSprite('white', '',1500,750)
	makeGraphic('white',1280,720,'FFFFFF')
	setProperty('white.visible',false)
	scaleObject('white',2,2)
	addLuaSprite('white',false)

	makeLuaSprite('plane', 'backgrounds/oneshot/onecolor',-650,-500)
	setScrollFactor('plane',0.99,0.99)
	setProperty('plane.alpha',1)
	addLuaSprite('plane',false)

	makeAnimatedLuaSprite('glow', 'backgrounds/oneshot/oneglow',550,600)
    addAnimationByPrefix('glow', 'glows', 'funnyglowythings',24,true)
	setScrollFactor('glow',0.85,0.85)
	setProperty('glow.alpha',1)
    addLuaSprite('glow',false)

	makeLuaSprite('rainbow', 'backgrounds/oneshot/rainbowloop',-500,900)
	setScrollFactor('rainbow',0.99,0.99)
	scaleObject('rainbow',0.25,1)
	setProperty('rainbow.alpha',0.02)
	setProperty('rainbow.angle',47)
	setSpriteShader('rainbow','scroll')
	addLuaSprite('rainbow',false)

	makeLuaSprite('rainbow2', 'backgrounds/oneshot/rainbowloop',584,600)
	setScrollFactor('rainbow2',0.99,0.99)
	scaleObject('rainbow2',0.3,1)
	setProperty('rainbow2.alpha',0.02)
	setProperty('rainbow2.angle',227)
	setSpriteShader('rainbow2','scroll')
	addLuaSprite('rainbow2',false)

	makeLuaSprite('chairs', 'backgrounds/oneshot/backgroundone',-700,1100)
	setScrollFactor('chairs',0.99,0.99)
	setProperty('chairs.alpha',1)
	addLuaSprite('chairs',false)

	makeLuaSprite('v', 'backgrounds/oneshot/vignette',0,0)
	setProperty('v.alpha',1)
	setObjectCamera('v','camHUD')
    addLuaSprite('v',true)

	makeLuaSprite('r', 'backgrounds/oneshot/overlay',100,0)
	setProperty('r.alpha',1)
	setObjectCamera('r','camHUD')
	setBlendMode('r','lighten')
    addLuaSprite('r',false)

	makeLuaSprite('a', 'rendersnlogos/airyrender',1250,-50)
scaleObject('a',0.65,0.65)
	setProperty('a.alpha',0)
	setObjectCamera('a','camHUD')
    addLuaSprite('a',true)

	makeLuaSprite('airyp', 'rendersnlogos/airyportraitforflash',265,-50)
		setProperty('airyp.alpha',0)
		setObjectCamera('airyp','camHUD')
		addLuaSprite('airyp',false)

		makeLuaSprite('bfp', 'rendersnlogos/scaredonebf',350,95)
		scaleObject('bfp',0.9,0.9)
			setProperty('bfp.alpha',0)
			setObjectCamera('bfp','camHUD')
			addLuaSprite('bfp',false)

			makeLuaSprite('gfp', 'rendersnlogos/onegf',425,50)
				setProperty('gfp.alpha',0)
				setObjectCamera('gfp','camHUD')
				addLuaSprite('gfp',false)

	makeAnimatedLuaSprite('logo', 'rendersnlogos/ONESHOTTEXT',0,0)
    addAnimationByPrefix('logo', 'title', 'Symbol 3 copy 2',24,true)
	screenCenter('logo','xy')
	setProperty('logo.alpha',0)
	setObjectCamera('logo','camHUD')
    addLuaSprite('logo',true)

	makeLuaSprite('fade', '',-1280,0);
	makeGraphic('fade',1280,720,'000000')
	addLuaSprite('fade',false);
	setObjectCamera('fade', 'other')
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'alpha',0)
	end

		if (shadersEnabled) then
			initLuaShader("colorInversion");
			
			makeLuaSprite("temporaryShader");
			makeGraphic("temporaryShader", screenWidth, screenHeight);
			
			setSpriteShader("temporaryShader", "colorInversion");
			setShaderInt("temporaryShader", "invert",0)
			
			addHaxeLibrary("ShaderFilter", "openfl.filters");
			runHaxeCode([[
				trace(ShaderFilter);
				game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
			]]);
	end
end



function onUpdatePost()
	songPos = getSongPosition()
	doTweenAlpha('glows','glow',getProperty('glow.alpha')-0.25*math.sin((songPos/1500) * (bpm/60) *0.75),0.01)
	doTweenAlpha('rainbowglow','r',0.95-1*math.sin((songPos/500) * (bpm/60) *1)/5,1)
setShaderFloat('rainbow','iTime',os.clock())
setShaderFloat('rainbow2','iTime',os.clock())
end