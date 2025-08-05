//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float speed;
uniform float waves;
uniform float wave_width;
uniform float texel_x;

void main()
{
	vec2 wave_coord = vec2(sin((u_time * speed) + (v_vTexcoord.y * waves)) * (wave_width *texel_x), 0.0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + wave_coord );
}
