function onUpdatePost(elapsed)
curAnim = getProperty("dad.animation.curAnim.name")

  if getProperty("healthBar.percent") < 80 then
    if curAnim == "singLEFT" or curAnim == "singLEFT-alt" then
      setProperty("iconP2.color", getColorFromHex("C14B99"))
      setHealthBarColors('C14B99', 'FFFFFF')
    elseif curAnim == "singDOWN" or curAnim == "singDOWN-alt" then
      setProperty("iconP2.color", getColorFromHex("01FFFF"))
      setHealthBarColors('01FFFF', 'FFFFFF')
    elseif curAnim == "singUP" or curAnim == "singUP-alt" then
      setProperty("iconP2.color", getColorFromHex("12FA04"))
      setHealthBarColors('12FA04', 'FFFFFF')
    elseif curAnim == "singRIGHT" or curAnim == "singRIGHT-alt" then
      setProperty("iconP2.color", getColorFromHex("FA3840"))
      setHealthBarColors('FA3840', 'FFFFFF')
    elseif curAnim == "idle" then
      setProperty("iconP2.color", getColorFromHex("FFFFFF"))
      setHealthBarColors('FFFFFF', 'FFFFFF')
    end
  else
    setProperty("iconP2.color", getColorFromHex("FFFFFF"))
    setHealthBarColors('723006', 'FFFFFF')
  end
end