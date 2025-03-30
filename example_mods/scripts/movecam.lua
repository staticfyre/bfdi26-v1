-- basic Camera Follow script

enabled = true

-- sing animations are done with offset
-- loop animations are half of the offset
local offset = {
    x = 20,
    y = 20,
}

local charAnimations = {
    ["singLEFT"]  = {-offset.x, "x"},
    ["singRIGHT"] = { offset.x, "x"},
    ["singUP"]    = {-offset.y, "y"},
    ["singDOWN"]  = { offset.y, "y"},

    ["singLEFT-alt"]  = {-offset.x * 0.5, "x"},
    ["singRIGHT-alt"] = { offset.x * 0.5, "x"},
    ["singUP-alt"]    = {-offset.y * 0.5, "y"},
    ["singDOWN-alt"]  = { offset.y * 0.5, "y"},
}

if not enabled then return end

local focused_on = "boyfriend"
function onMoveCamera(character)
    focused_on = character
end

function onUpdatePost(dt)
    local animation_name = getProperty(focused_on .. ".animation.curAnim.name")
    local animation = charAnimations[animation_name]
    if not animation then return end

    local camera_position = getProperty("camGame.scroll." .. animation[2])

    if enabled == true then
    setProperty(
        "camGame.scroll." .. animation[2],
        lerp(
            camera_position,
            camera_position + (animation[1] * (1 / getProperty('camGame.zoom'))),
            dt * getProperty('cameraSpeed') * playbackRate
        )
    )
end
end

function lerp(a, b, c)
    return a + (b - a) * c
end