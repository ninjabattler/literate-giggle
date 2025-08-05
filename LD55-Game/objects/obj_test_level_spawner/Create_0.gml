/// @description Insert description here
// You can write your code in this editor
event_inherited();

var _tex_array = texturegroup_get_textures("LichBoss");
for (var i = 0; i < array_length(_tex_array); ++i;)
{
    texture_prefetch(_tex_array[i]);
}

_waves = [
	tl_test_wave_1,
	tl_test_wave_2,
	tl_test_wave_3,
	tl_test_wave_4,
	tl_test_wave_5
]
