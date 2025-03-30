function onEvent(n,v1)
if n == 'CamZoom' then
setProperty('defaultCamZoom',getProperty('defaultCamZoom')+v1)
end
end