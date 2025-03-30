amount = 0

function onSongStart()
	setProperty("canPause", false)
	setProperty('camGame.alpha',0)
    for _, hudout in ipairs({'uiGroup','bars','textmiss','iconP1Animated','iconP2Animated','scoreTxt','hyper','textacc'}) do
setProperty(hudout..'.alpha',0)
setProperty('botplayTxt.visible',false)
setProperty('canPause',false)
	end
	for i = 0, 7 do
        noteTweenAlpha("Notealpha"..i.."",i,0, 0.001)
	end

    setProperty('isCameraOnForcedPos', true)
	setProperty('camFollow.y',0)
	setProperty('camFollow.x',800)

	if createfile == true then
		saveFile('BFDI26/weeks/8.json',
[[{
	"storyName": "pridemfonfplideflag",
	"difficulties": "normal",
	"hideFreeplay": false,
	"weekBackground": "stage",
	"weekBefore": "tutorial",
	"freeplayColor": [
		146,
		113,
		253
	],
	"startUnlocked": true,
	"hideStoryMode": true,
	"songs": [
		[
			"web-crasher",
			"prideflag",
			[
				255,
				255,
				255
			]
		]
	],
	"weekCharacters": [
		"dad",
		"bf",
		"gf"
	],
	"hiddenUntilUnlocked": false,
	"weekName": "fello"
}]])
		end
end

function onTweenCompleted(tag)
	if tag == 'healthTween' then
		doTweenColor('healthTween2','healthBar.leftBar','00FF00',1.5)
	elseif tag == 'healthTween2' then
		doTweenColor('healthTween3','healthBar.leftBar','0000FF',1.5)
	elseif tag == 'healthTween3' then
		doTweenColor('healthTween','healthBar.leftBar','FF0000',1.5)
	end
	end

function onCreate() 
	if checkFileExists("BFDI26/weeks/8.json") then
		createfile = false
		else
		createfile = true
		end

	doTweenZoom('camGamehihi','camGame',4,0.001)
	setProperty('iconsAnimations', false)
	setProperty('camGame.bgColor', getColorFromHex('FFFFFF'))
	addLuaScript('data/customratio')
	setProperty('textmiss.alpha',1)
	setProperty('bars.alpha',1)

	makeLuaSprite('galaxy', 'backgrounds/web-crasher/galaxybg',-750,-200)
	setProperty('galaxy.alpha',0)
	setScrollFactor('galaxy',0.5,0.5)
	addLuaSprite('galaxy',false)

makeLuaSprite('hyper','backgrounds/web-crasher/hypercam',625,0)
setObjectCamera('hyper','other')
scaleObject('hyper',0.25,0.25)
addLuaSprite('hyper',true)

makeLuaSprite("ytpmv", null, 0, 423)
makeGraphic("ytpmv", 400, 232.5, 'FFFFF')
screenCenter("ytpmv", 'x')
setObjectCamera("ytpmv", 'hud')
addLuaSprite("ytpmv",false)
setProperty("ytpmv.alpha",0)

makeLuaSprite('hue', '', 0, 0);
setProperty('hue.visible',false)
  addLuaSprite('hue',false);

  makeLuaText('textThis', 'THIS',1000,-125,150)
  setProperty('textThis.alpha',0)
  setTextSize('textThis',200)
  setTextFont('textThis','impact.TTF')
  setObjectCamera('textThis','other')
  addLuaText('textThis',true)

  makeLuaText('textIs', 'IS',1000,175,150)
  setProperty('textIs.alpha',0)
  setTextSize('textIs',200)
  setTextFont('textIs','impact.TTF')
  setObjectCamera('textIs','other')
  addLuaText('textIs',true)

  makeLuaText('textSparta', 'SPARTA',1000,75,360)
  screenCenter('textSparta','x')
  setProperty('textSparta.alpha',0)
  setTextSize('textSparta',200)
  setTextFont('textSparta','impact.TTF')
  setObjectCamera('textSparta','other')
  addLuaText('textSparta',true)
end

function onCreatePost()

    setProperty('textmiss.x',-250)

	makeAnimatedLuaSprite('iconP1Animated','icons/icon-hatanimated',0,getProperty('iconP1.y'))
addAnimationByPrefix('iconP1Animated','normal','Idle',24,true)
addAnimationByPrefix('iconP1Animated','losing','Died',24,true)
setObjectCamera('iconP1Animated','camHUD')
addLuaSprite('iconP1Animated',true)

makeAnimatedLuaSprite('iconP2Animated','icons/icon-flag',0,getProperty('iconP2.y')-30)
addAnimationByPrefix('iconP2Animated','normal','Symbol 3',24,true)
addAnimationByPrefix('iconP2Animated','losing','Symbol 4',24,true)
scaleObject('iconP2Animated',0.9,0.9)
setObjectCamera('iconP2Animated','camHUD')
addLuaSprite('iconP2Animated',true)

setProperty('gf.visible',false)
setProperty('boyfriend.visible',false)
setProperty('iconP1.visible',false)
setProperty('iconP2.visible',false)

if (shadersEnabled) then
	initLuaShader("compressed");
	initLuaShader("galaxy");
	initLuaShader("colorInversion");
	initLuaShader("adjustColor");
	
	makeLuaSprite("temporaryShader");
	makeGraphic("temporaryShader", screenWidth, screenHeight);

	makeLuaSprite("temporaryShader2");
	makeGraphic("temporaryShader2", screenWidth, screenHeight);

	makeLuaSprite("temporaryShader3");
	makeGraphic("temporaryShader3", screenWidth, screenHeight);
	
	setSpriteShader("temporaryShader", "compressed");

	setSpriteShader("temporaryShader2", "colorInversion");
	setShaderInt("temporaryShader2", "invert", 0)

	setSpriteShader("temporaryShader3", "adjustColor");

	setSpriteShader('hyper','compressed')
	setSpriteShader("galaxy", "galaxy");
	
	addHaxeLibrary("ShaderFilter", "openfl.filters");
	runHaxeCode([[
		trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader),(new ShaderFilter(game.getLuaObject("temporaryShader2").shader))]);
game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
game.camOther.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
	]]);
end
end

function onUpdatePost()
	setProperty('hue.x',getProperty('hue.x')+2.5)
	amount = getProperty('hue.x')

setShaderFloat('galaxy','iTime',os.clock()*2)
setShaderFloat('temporaryShader3','hue',amount)

setProperty('iconP1Animated.x',getProperty('iconP1.x'))
setProperty('iconP2Animated.x',getProperty('iconP2.x'))

if getProperty('health') <0.4 then
objectPlayAnimation('iconP1Animated','losing')
elseif getProperty('health') >0.4 and getProperty('health') <1.6 then
	objectPlayAnimation('iconP1Animated','normal')
	objectPlayAnimation('iconP2Animated','normal')
else
	objectPlayAnimation('iconP2Animated','losing')
end
end