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

#define POST_STEPS 4.
// https://www.shadertoy.com/view/XdGfRR
vec2 hash22(vec2 p)
{
	uvec2 q = uvec2(ivec2(p))*uvec2(1597334673U, 3812015801U);
	q = (q.x ^ q.y) * uvec2(1597334673U, 3812015801U);
	return vec2(q) * 2.328306437080797e-10;
}

vec3 posterize(vec3 col) { return floor(col*POST_STEPS)/POST_STEPS; }
float luma(vec3 col) { return dot(col, vec3(.299,.584,.119)); }

mat3 saturation(float s)
{
    float s_1 = 1. - s;
    vec3 l = vec3(.299,.584,.119);
    vec3 s_r = vec3(l.x*s_1)+vec3(s,0,0);
    vec3 s_g = vec3(l.y*s_1)+vec3(0,s,0);
    vec3 s_b = vec3(l.z*s_1)+vec3(0,0,s);
    
    return mat3(s_r,s_g,s_b);
}

vec2 uv_offset(vec2 p)
{
    vec2 pg = floor(p);
    vec2 pc = fract(p);
    
    return mix(
        mix(hash22(pg+vec2(0,0)),hash22(pg+vec2(1,0)),pc.x),
        mix(hash22(pg+vec2(0,1)),hash22(pg+vec2(1,1)),pc.x),
    pc.y)*2.-1.;
}

void mainImage()
{
    vec2 uv = fragCoord/iResolution.xy;
    vec2 scaler = vec2(8.);
    vec2 uv2 = uv+uv_offset((uv+floor(iTime*.45*scaler))*8.)*.01;
    vec3 col = posterize(texture(iChannel0,uv2).rgb)*saturation(1.);
    //col *= vec3(1., .7, .65);
    
    fragColor = vec4(col,1.0);
}