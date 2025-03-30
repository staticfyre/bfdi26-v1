function onUpdatePost()
    if dadName == 'prideytpmv' then
    setObjectCamera('dad','camHUD')
    end
    if dadName == 'prideytpmv' and getProperty("dad.animation.curAnim.name") == 'idle' then
    setProperty('dad.visible',false)
    else
    setProperty('dad.visible',true)
end
end