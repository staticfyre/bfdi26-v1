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

float random(float x) {
 
    return fract(sin(x) * 10000.);
    
}

float noise(vec2 p) {
    
 	return random(p.x + p.y * 10000.);
    
}

vec2 sw(vec2 p) { return vec2(floor(p.x), floor(p.y)); }
vec2 se(vec2 p) { return vec2(ceil(p.x), floor(p.y)); }
vec2 nw(vec2 p) { return vec2(floor(p.x), ceil(p.y)); }
vec2 ne(vec2 p) { return vec2(ceil(p.x), ceil(p.y)); }

float smoothNoise(vec2 p) {
 
    vec2 interp = smoothstep(0., 1., fract(p));
    float s = mix(noise(sw(p)), noise(se(p)), interp.x);
    float n = mix(noise(nw(p)), noise(ne(p)), interp.x);
    return mix(s, n, interp.y);
    
}

float fractalNoise(vec2 p) {
 
    float n = 0.;
    n += smoothNoise(p);
    n += smoothNoise(p * 2.) / 2.;
    n += smoothNoise(p * 4.) / 4.;
    n += smoothNoise(p * 8.) / 8.;
    n += smoothNoise(p * 16.) / 16.;
    n /= 1. + 1./2. + 1./4. + 1./8. + 1./16.;
    return n;
    
}

void mainImage()
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 nuv = vec2(uv.x - iTime / 6., uv.y);
    uv *= vec2(1., -1.);
    
	float x = fractalNoise(nuv * 6.);
    vec3 final = mix(vec3(x), texture(iChannel0, uv).xyz, pow(abs(uv.y), .5));
    
    fragColor = vec4(final, 0.1);
}