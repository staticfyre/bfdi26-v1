function onUpdatePost()
    if boyfriendName == 'bifriendytpmv' then
    setObjectCamera('boyfriend','camHUD')
    end
    if boyfriendName == 'bifriendytpmv' and getProperty("boyfriend.animation.curAnim.name") == 'idle' then
    setProperty('boyfriend.visible',false)
    else
    setProperty('boyfriend.visible',true)
end
end