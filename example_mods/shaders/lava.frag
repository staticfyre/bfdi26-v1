#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define iChannel1 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage()
{
    vec2 col;
    float t = iTime*.1;
    vec2 uv = (fragCoord-iResolution.xy)/iResolution.y+vec2(t,t*2.0);
    float factor = 1.5;
    vec2 v1;
    for(int i=0;i<12;i++)
    {
        uv *= -factor*factor;
        v1 = uv.yx/factor;
        uv += sin(v1+col+t*10.0)/factor;
        col += vec2(sin(uv.x-uv.y+v1.x-col.y),sin(uv.y-uv.x+v1.y-col.x));
    }
    fragColor = vec4(vec3(col.x+4.0,col.x-col.y/2.0,col.x/5.0)/2.0,1.0);
}