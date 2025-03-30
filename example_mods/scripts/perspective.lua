--[[ perspective sprite ]]

local vanish_offset = {x = 0, y = 0}
local sprites = {}

function _setPerspective(tag, depth)
	depth = tonumber(depth) or 1
	
	if sprites[tag] then
		sprites[tag].depth = depth
	else
		sprites[tag] = {
			x = getProperty(tag .. ".x"),
			y = getProperty(tag .. ".y"),
			width = getProperty(tag .. ".width"),
			height = getProperty(tag .. ".height"),
			scale = {x = getProperty(tag .. ".scale.x"), y = getProperty(tag .. ".scale.y")},
			depth = depth
		}
		
		setSpriteShader(tag, "perspective")
		setShaderFloatArray(tag, "u_top", {0, 1})
		setShaderFloat(tag, "u_depth", depth)
	end
end

function _removePerspective(tag)
	local sprite = sprites[tag]
	if sprite then
		scaleObject(tag, sprite.scale.x, sprite.scale.y, true)
		setProperty(tag .. ".x", sprite.x)
		setProperty(tag .. ".y", sprite.y)
		
		removeSpriteShader(tag)
		
		sprites[tag] = nil
	end
end

function _setVanishOffset(x, y)
	if x then vanish_offset.x = tonumber(x) or 0 end
	if y then vanish_offset.y = tonumber(y) or 0 end
end

--

for _, func in pairs({"max"}) do _G[func] = math[func] end

function onCreatePost()
	initLuaShader("perspective")
	
	runHaxeCode([[
		createGlobalCallback("setPerspective", function(tag:String, depth:Float) {parentLua.call("_setPerspective", [tag, depth]);});
		createGlobalCallback("removePerspective", function(tag:String) {parentLua.call("_removePerspective", [tag]);});
		createGlobalCallback("setVanishOffset", function(x:Float, y:Float) {parentLua.call("_setVanishOffset", [x, y]);});
	]])
end

function onUpdatePost()
	local cam = {x = getProperty("camGame.scroll.x") + screenWidth / 2 + vanish_offset.x, y = getProperty("camGame.scroll.y") + screenHeight / 2 + vanish_offset.y}
	
	for tag, sprite in pairs(sprites) do
		local vanish = {x = (cam.x - sprite.x) / sprite.width, y = 1 - (cam.y - sprite.y) / sprite.height}
		local top = {sprite.depth * vanish.x, sprite.depth * (vanish.x - 1) + 1}
		
		if top[2] > 1 then
			scaleObject(tag, sprite.scale.x * (1 + sprite.depth * (vanish.x - 1)), sprite.scale.y * (sprite.depth * vanish.y), true)
		elseif top[1] < 0 then
			scaleObject(tag, sprite.scale.x * (1 - sprite.depth * (vanish.x)), sprite.scale.y * (sprite.depth * vanish.y), true)
			setProperty(tag .. ".x", sprite.x + sprite.width * sprite.depth * vanish.x)
		else
			scaleObject(tag, sprite.scale.x, sprite.scale.y * (sprite.depth * vanish.y), true)
		end
		
		setProperty(tag .. ".y", sprite.y + sprite.height * (1 - sprite.depth * max(vanish.y, 0)))
		
		setShaderFloatArray(tag, "u_top", top)
	end
end