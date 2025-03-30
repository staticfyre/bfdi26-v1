
function getIconColor(chr)
    return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
    return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if _G['boyfriendGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
        createGhost('boyfriend')
    end
    if not isSustainNote then
        _G['boyfriendGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
        updateGData('boyfriend')    
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if _G['dadGhostData.strumTime'] == getPropertyFromGroup('notes', id, 'strumTime') and not isSustainNote then
        createGhost('dad')
    end
    if not isSustainNote then
        _G['dadGhostData.strumTime'] = getPropertyFromGroup('notes', id, 'strumTime')
        updateGData('dad')    
    end
end

function createGhost(char)
leftorright = getRandomInt(1,2)

    songPos = getSongPosition() --in case game stutters
    makeAnimatedLuaSprite(char..'Ghost'..songPos, getProperty(char..'.imageFile'),getProperty(char..'.x'),getProperty(char..'.y'))
    addLuaSprite(char..'Ghost'..songPos, false)
    setProperty(char..'Ghost'..songPos..'.scale.x',getProperty(char..'.scale.x'))
    setProperty(char..'Ghost'..songPos..'.scale.y',getProperty(char..'.scale.y'))
    doTweenX(char..'Ghost'..songPos..'scaleX', char..'Ghost'..songPos..'.scale',getProperty(char..'.scale.x')+0.2,2.5,'quadOut')
    doTweenY(char..'Ghost'..songPos..'scaleY', char..'Ghost'..songPos..'.scale',getProperty(char..'.scale.y')+0.2,2.5,'quadOut')
    setProperty(char..'Ghost'..songPos..'.flipX', getProperty(char..'.flipX'))
    setProperty(char..'Ghost'..songPos..'.color', getIconColor(char))
    setProperty(char..'Ghost'..songPos..'.alpha', 1)
    doTweenAlpha(char..'Ghost'..songPos..'delete', char..'Ghost'..songPos, 0,0.5)
    setProperty(char..'Ghost'..songPos..'.animation.frameName', _G[char..'GhostData.frameName'])
    setProperty(char..'Ghost'..songPos..'.offset.x', _G[char..'GhostData.offsetX'])
    setProperty(char..'Ghost'..songPos..'.offset.y', _G[char..'GhostData.offsetY'])
    setObjectOrder(char..'Ghost'..songPos, getObjectOrder(char..'Group')-1)

if leftorright == 1 then
doTweenX(char..'Ghost'..songPos..'move',char..'Ghost'..songPos,getProperty(char..'Ghost'..songPos..'.x')-200,4,'circOut')
else
doTweenX(char..'Ghost'..songPos..'move',char..'Ghost'..songPos,getProperty(char..'Ghost'..songPos..'.x')+200,4,'circOut')
end
end

function onTweenCompleted(tag)
    if (tag:sub(#tag- 5, #tag)) == 'delete' then
        removeLuaSprite(tag:sub(1, #tag - 6), true)
    end
end

function updateGData(char)
    _G[char..'GhostData.frameName'] = getProperty(char..'.animation.frameName')
    _G[char..'GhostData.offsetX'] = getProperty(char..'.offset.x')
    _G[char..'GhostData.offsetY'] = getProperty(char..'.offset.y')
end