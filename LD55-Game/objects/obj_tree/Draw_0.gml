/// @description Insert description here
// You can write your code in this editor

shader_set(sh_test)

draw_sprite(spr_tree2,0,x,y)

shader_set_uniform_f(shader_get_uniform(sh_test,"size"),384,384,5)
shader_set_uniform_f(shader_get_uniform(sh_test,"base_alpha"),0.5)
shader_set_uniform_f(shader_get_uniform(sh_test,"direction"),4)

shader_reset();

draw_self()
draw_sprite_ext(spr_tree1, 0, x, y, image_xscale, image_yscale, image_angle, _colour_tint, 0.4);