/// @description Insert description here
// You can write your code in this editor
shader_set(sh_test)

draw_sprite(spr_rock_medium2,0,x,y)
shader_set_uniform_f(shader_get_uniform(sh_test,"size"),256,256,0.1)
shader_set_uniform_f(shader_get_uniform(sh_test,"base_alpha"),0.5)

shader_reset();

draw_self()