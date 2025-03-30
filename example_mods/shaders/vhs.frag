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

#define PI 3.14159265

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

vec3 tex2D( sampler2D _tex, vec2 _p )
{
  vec3 col = texture( _tex, _p ).xyz;
  if ( 0.5 < abs( _p.x - 0.5 ) ) {
    col = vec3( 0.1 );
  }
  
  col = vec3(col.x, col.y, col.z);
  return col;
}

vec2 grad( ivec2 z )  // replace this anything that returns a random vector
{
    // 2D to 1D  (feel free to replace by some other)
    int n = z.x+z.y*11111;

    // Hugo Elias hash (feel free to replace by another one)
    n = (n<<13)^n;
    n = (n*(n*n*15731+789221)+1376312589)>>16;

    // simple random vectors
    return vec2(cos(float(n)),sin(float(n)));
}

float pnoise( in vec2 p )
{
    ivec2 i = ivec2(floor( p ));
     vec2 f =       fract( p );
	
	vec2 u = f*f*(3.0-2.0*f); // feel free to replace by a quintic smoothstep instead

    return mix( mix( dot( grad( i+ivec2(0,0) ), f-vec2(0.0,0.0) ), 
                     dot( grad( i+ivec2(1,0) ), f-vec2(1.0,0.0) ), u.x),
                mix( dot( grad( i+ivec2(0,1) ), f-vec2(0.0,1.0) ), 
                     dot( grad( i+ivec2(1,1) ), f-vec2(1.0,1.0) ), u.x), u.y);
}

float perlinNoise ( vec2 fragPos, vec2 uv)
{
    float f = 0.0;
    
    uv *= 8.0;
    mat2 m = mat2( 1.6,  1.2, -1.2,  1.6 );
    f  = 0.5000*pnoise( uv ); uv = m*uv;
    f += 0.2500*pnoise( uv ); uv = m*uv;
    f += 0.1250*pnoise( uv ); uv = m*uv;
    f += 0.0625*pnoise( uv ); uv = m*uv;
    
    return 0.5 + 0.5*f;
}


float hash( vec2 _v ){
  return fract( sin( dot( _v, vec2( 89.44, 19.36 ) ) ) * 22189.22 );
}

float iHash( vec2 _v, vec2 _r ){
  float h00 = hash( vec2( floor( _v * _r + vec2( 0.0, 0.0 ) ) / _r ) );
  float h10 = hash( vec2( floor( _v * _r + vec2( 1.0, 0.0 ) ) / _r ) );
  float h01 = hash( vec2( floor( _v * _r + vec2( 0.0, 1.0 ) ) / _r ) );
  float h11 = hash( vec2( floor( _v * _r + vec2( 1.0, 1.0 ) ) / _r ) );
  vec2 ip = vec2( smoothstep( vec2( 0.0, 0.0 ), vec2( 1.0, 1.0 ), mod( _v*_r, 1. ) ) );
  return ( h00 * ( 1. - ip.x ) + h10 * ip.x ) * ( 1. - ip.y ) + ( h01 * ( 1. - ip.x ) + h11 * ip.x ) * ip.y;
}

float noise( vec2 _v ){
  float sum = 0.;
  for( int i=1; i<9; i++ )
  {
    sum += iHash( _v + vec2( i ), vec2( 2. * pow( 2., float( i ) ) ) ) / pow( 2., float( i ) );
  }
  return sum;
}

#define TapeSpeed 3.0


void mainImage()
{
    vec2 fragPos = fragCoord/iResolution.xy;
    vec2 fPos = fragPos * 2.0 - 1.0;
    fPos.x *= iResolution.x / iResolution.y;
    
    float dist = length(fPos);
    
    float vignette = smoothstep(0.7,4.0, dist);

    vec2 uv = fragPos*vec2(iResolution.x/iResolution.y,1.0) + vec2(0.0, iTime*0.05);
    vec2 uvn = fragCoord/iResolution.xy;
    
    float randomOffset = noise(vec2(iTime * 0.5f,0)) * 0.0f;
    randomOffset -= 0.05f;
    
    // Perlin Noise
    float pNoise = perlinNoise(fragPos, uv);
    //float pNoise = 0.0;
    
    // tape wave
    uvn.x += ( noise( vec2( uvn.y, iTime/ 2.0) ) - 0.5 )* 0.0005 * pNoise;
    uvn.x += ( noise( vec2( uvn.y * 5.0, iTime * TapeSpeed) ) - 0.5 ) * 0.001 * pNoise;
    
    // tape crease
    
    float randSPD = rand(vec2(0.0, fragPos.y + iTime));
    float tcPhase = clamp( ( sin( uvn.y * 8.0 + randomOffset * 2.0 + (iTime + randomOffset * 0.005f)) - 0.92 ) * noise( vec2( iTime ) ), 0.0, 0.01 ) * 10.0;
    float tcNoise = max( noise( vec2( uvn.y * 100.0, iTime * 100.0 ) ) - 0.5, 0.0);
    uvn.x = uvn.x - tcNoise * tcPhase * pNoise;
    
    vec3 col = vec3(0.0);
    
    // switching noise
    float snPhase = smoothstep( 0.03, 0.0, uvn.y );
    uvn.y += snPhase * 0.7;
    uvn.x += snPhase * ( ( noise( vec2( uv.y * 100.0, iTime * 10.0 ) ) - 0.5 ) * 0.2 );

    col = tex2D( iChannel0, uvn );
    col *= 1.0 - tcPhase;
    col = mix(
    col,
    col.yzx,
    snPhase
    );
    
    // bloom
    for( float x = -4.0; x < 2.5; x += 1.0 ){
    col.xyz += vec3(
      tex2D( iChannel0, uvn + randomOffset * 2.0 *vec2( x, 0.0 ) * 7E-3 ).x,
      tex2D( iChannel0, uvn + randomOffset * 1.0 * vec2( x - 2.0, 0.0  ) * 7E-3 ).y,
      tex2D( iChannel0, uvn + randomOffset * 12.0 * vec2( x - 4.0, 0.0 ) * 7E-3 ).z
    ) * 0.1;
    }
    col *= 0.6;

    // ac beat
    col *= 1.0 + clamp( noise( vec2( 0.0, uv.y + sin(iTime * 0.5f + randomOffset) * 0.2) ) * 0.6 - 0.25, 0.0, 0.1 );
    col *= 1.0 - vignette;
    
    
	fragColor = vec4( col.x, col.y, col.z, 1.0 );
}