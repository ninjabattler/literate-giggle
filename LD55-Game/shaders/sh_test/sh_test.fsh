varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 size;//width,height,radius
uniform float base_alpha;
const int Quality = 32;
const int Directions = 1;
const float Pi = 6.28318530718;//pi * 2
void main()
{
    vec2 radius = size.z/size.xy;
    radius+=radius*(1.-v_vTexcoord.y);
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord).a*vec4(0.,0.,0.,1.);
	float d = 35.;
    //for( float d=0.0;d<Pi;d+=Pi/float(Directions) )
    //{
        for( float i=1.0/float(Quality);i<=1.0;i+=1.0/float(Quality) )
        {
                Color += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(d),sin(d))*radius*i).a*vec4(0.,0.,0.,1.);
        }
    //}
    Color /= float(Quality)*float(Directions)+1.0;
    gl_FragColor =  Color *  v_vColour;
    gl_FragColor.a*=(v_vTexcoord.y)*base_alpha;
}