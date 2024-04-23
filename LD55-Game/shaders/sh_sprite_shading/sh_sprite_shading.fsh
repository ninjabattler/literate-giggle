//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D bump;

void main()
{
	vec4 a_color = texture2D( bump, v_vTexcoord );

    gl_FragColor = a_color;
}
