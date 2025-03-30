    #pragma header

    vec2 uv = openfl_TextureCoordv.xy;
    vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
    uniform float iTime;
    #define iChannel0 bitmap
    #define iChannel1 bitmap
    #define iChannel2 bitmap
    #define iChannelResolution bitmap
    #define texture flixel_texture2D
    #define fragColor gl_FragColor
    #define mainImage main
    uniform float uTime;
    uniform vec4 iMouse;

#define BLENDCOEFF  (iMouse.z > 0.5 ? 0. : 2.) // (8.*0.) // negative => cartoon effect
#define RADIUS   	(3) // if you tweak this u have to tweak two next values :(  
#define BLENDCMIN   (-25.)
#define BLENCCMAX   (1.)
#define DIAMETER 	(5.)
#define SPACESMOOTH (1./1.41)
#define INTENSITYSMOOTH (0.01) // (iMouse.y/iResolution.y*0.) // the bigger the glower
#define EPSILON 	(1e-0)
#define LUMWEIGHT   (vec4(0.,0.,0.001,0.))

#define UNMIX(t,a,b) ( clamp( (t-a)/(b-a) ,0. , 10.) )

vec2 viewport(vec2 p)
{   
    return p/(iResolution.xy);
}

void mainImage()
{
    vec4 pixelColor = texture(iChannel0,viewport(fragCoord.xy));
    fragColor = vec4(0.);
    float sum = 0.;
    float coeff;
    vec4 diff;
    vec4 color = vec4(0.);
    
    float IntensitySmooth2 = INTENSITYSMOOTH*INTENSITYSMOOTH;
    float SpaceSmooth2 = float(RADIUS*RADIUS)*SPACESMOOTH*SPACESMOOTH;
    
    for( int i = -RADIUS ; i <= RADIUS ; i++ ){
        
        
        for( int j = -RADIUS ; j <= RADIUS ; j++ ){
            
            color = texture(iChannel0,viewport(fragCoord.xy+vec2(i,j)));
            
            diff = color - pixelColor;
            coeff = exp( -(
                  dot(diff*diff,LUMWEIGHT)/IntensitySmooth2
                + float(i*i+j*j)/SpaceSmooth2 ) );
            
            //color = log(color+EPSILON);
            
            if( i == -RADIUS && j == -RADIUS ){
            	fragColor = color*coeff;
            } else {
            	fragColor += color*coeff;
            }
            
            sum += coeff;
            
        }
        
    }
    
	//fragColor = exp(fragColor/sum - EPSILON);
	fragColor = fragColor/sum;
    
    diff = pixelColor - fragColor;
    // uncertainty : http://people.csail.mit.edu/fredo/PUBLI/Siggraph2002/DurandBilateral.pdf
    // if sum is too low we don't want to increases local contrast
    coeff = 1.;
    coeff = UNMIX( log(sum/float(DIAMETER*DIAMETER)) , BLENDCMIN , BLENCCMAX );
    
    fragColor = pixelColor + coeff*BLENDCOEFF*diff;
    
    // to see uncertainty
    //fragColor = vec4(coeff);
}