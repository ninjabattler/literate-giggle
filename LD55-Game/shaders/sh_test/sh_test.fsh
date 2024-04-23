varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size;//width,height,radius
uniform float base_alpha;
uniform float direction;
const int Quality = 16;
const int Directions = 1;
const float Pi = 6.28318530718;//pi * 2
void main()
{
    vec2 radius = size.z/size.xy;
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord).a*vec4(0.,0.,0.,1.);
	
    for( float i=1.0/float(Quality);i<=1.0;i+=1.0/float(Quality) )
    {
            Color += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(direction),sin(direction))*radius*i).a*vec4(0.,0.,0.,1.);
    }
 
    Color /= float(Quality)*float(Directions)+1.0;
    gl_FragColor =  Color *  v_vColour;
    gl_FragColor.a*=base_alpha;
}