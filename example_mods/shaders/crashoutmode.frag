//SHADERTOY PORT FIX
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
uniform vec4 iMouse;   
#define iChannel0 bitmap
#define iChannel1 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
#define time iTime
//SHADERTOY PORT FIX

void mainImage()
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	uv = 2.0 * (uv - 0.5);
	uv.x *= iResolution.x / iResolution.y;
	
	float ang = atan(uv.y, uv.x);
	float dist = length(uv);
	
	float d = sin((4.0*iTime+5.0*sin(iTime)*length(uv)+ang*4.0+5.954)*16.0)*(0.2+0.1*sin(iTime*0.3))+dist*.1+.8;
	
	fragColor = vec4(vec3(d),1.0);
}