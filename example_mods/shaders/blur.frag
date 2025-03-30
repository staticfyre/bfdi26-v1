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

const int nsamples = 10;
	uniform float blurStart = 1.0;
    uniform float blurWidth = 0.0;

void mainImage()
{
    vec2 center = 1.0;

    
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    uv -= center;
    float precompute = blurWidth * (1.0 / float(nsamples - 1));
    
    vec4 color = vec4(0.0);
    for(int i = 0; i < nsamples; i++)
    {
        float scale = blurStart + (float(i)* precompute);
        color += texture(iChannel0, uv * scale + center);
    }
    
    
    color /= float(nsamples);
    
	fragColor = color;
}