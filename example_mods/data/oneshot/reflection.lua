function onCreatePost()
        
    BFAlpha = 0.35
    DADAlpha = 0.35

    checkCharacter()
    checkSong()

--------------------------------------------------

    if showBF then

        bfimage = getProperty('boyfriend.imageFile')
        bfframe = getProperty('boyfriend.animation.frameName')
        bfx = getProperty('boyfriend.x')

        bfscaleX = getProperty('boyfriend.scale.x')
        bfscaleY = getProperty('boyfriend.scale.y')
        bfoffsetX = getProperty('boyfriend.offset.x')
        bfoffsetY = getProperty('boyfriend.offset.y')
        bfflipX = getProperty('boyfriend.flipX')
        
        setObjectOrder('bfPhantom',getObjectOrder('boyfriendGroup')-1)
        makeAnimatedLuaSprite('bfPhantom',bfimage,bfx,0)
        addLuaSprite('bfPhantom',false)
        setProperty('bfPhantom.offset.x',bfoffsetX)
        setProperty('bfPhantom.offset.y',bfoffsetY-25)
        setProperty('bfPhantom.scale.x',bfscaleX)
        setProperty('bfPhantom.scale.y',bfscaleY)
        setProperty('bfPhantom.alpha',BFAlpha)
        setProperty('bfPhantom.flipX', bfflipX)
        setProperty('bfPhantom.flipY', true)
        setProperty('bfPhantom.y',(getProperty('boyfriend.y')-11.5) + getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y') * 2 - bfoffsetY * 2 + BFYFix)
    end

-----------------------------boyfriend sprite---------------------

    if showDAD then
        dadimage = getProperty('dad.imageFile')
        dadframe = getProperty('dad.animation.frameName')
        dadx = getProperty('dad.x')

        dadscaleX = getProperty('dad.scale.x')
        dadscaleY = getProperty('dad.scale.y')
        dadoffsetX = getProperty('dad.offset.x')
        dadoffsetY = getProperty('dad.offset.y')
        dadflipX = getProperty('dad.flipX')

        setObjectOrder('dadPhantom',getObjectOrder('dadGroup')-1)
        makeAnimatedLuaSprite('dadPhantom',dadimage,dadx,0)
        addLuaSprite('dadPhantom',false)
        setProperty('dadPhantom.offset.x',dadoffsetX)
        setProperty('dadPhantom.offset.y',dadoffsetY)
        setProperty('dadPhantom.scale.x',dadscaleX)
        setProperty('dadPhantom.scale.y',dadscaleY)
        setProperty('dadPhantom.alpha',DADAlpha)
        setProperty('dadPhantom.flipY', true);
        setProperty('dadPhantom.flipX', dadflipX)
        setProperty('dadPhantom.y',(getProperty('dad.y')-14.5) + getProperty('dad.frameHeight') * getProperty('dad.scale.y') * 2 - dadoffsetY * 2 + DADYFix)
    end
    
--------------------------dad sprite--------------------------
end


function onUpdate()


    bfframe = getProperty('boyfriend.animation.frameName')
    addAnimationByPrefix('bfPhantom','b',bfframe,1,true)
    objectPlayAnimation("bfPhantom","b",true)
    bfoffsetX = getProperty('boyfriend.offset.x')
    bfoffsetY = getProperty('boyfriend.offset.y')
    setProperty('bfPhantom.offset.x',bfoffsetX)
    setProperty('bfPhantom.offset.y',getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y')-bfoffsetY)

-----------------------------boyfriend playanim---------------

    dadframe = getProperty('dad.animation.frameName')
    addAnimationByPrefix('dadPhantom','d',dadframe,1,true)
    objectPlayAnimation("dadPhantom","d",true)
    dadoffsetX = getProperty('dad.offset.x')
    dadoffsetY = getProperty('dad.offset.y')
    setProperty('dadPhantom.offset.x',dadoffsetX)
    setProperty('dadPhantom.offset.y',getProperty('dad.frameHeight')*getProperty('dad.scale.y')-dadoffsetY)

-----------------------------dad playanim---------------

end

function checkCharacter()
        BFYFix = 0    
      DADYFix = 0    
        GFYFix = 0    
    end

function checkSong()
        showBF = true
        showDAD = true  
    end