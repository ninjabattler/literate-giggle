/// @description Insert description here
// You can write your code in this editor

shader_set(sh_test)

draw_sprite(spr_tree1_mask,0,x,y)

shader_set_uniform_f(shader_get_uniform(sh_test,"size"),384,384,5)
shader_set_uniform_f(shader_get_uniform(sh_test,"base_alpha"),0.5)
shader_set_uniform_f(shader_get_uniform(sh_test,"direction"),4)

shader_reset();
shader_set(sh_wave_x);

var tex = sprite_get_texture(spr_tree1_mask, 0);
var tex_w = texture_get_texel_width(tex);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "u_time"), (current_time + ran_num) * global.game_speed);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "texel_x"), tex_w);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "speed"), 0.0025);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "waves"), 50);
shader_set_uniform_f(shader_get_uniform(sh_wave_x, "wave_width"), 1 + ran_num);

draw_self()
draw_sprite_ext(spr_tree1, 0, x, y, image_xscale, image_yscale, image_angle, _colour_tint, 0.4);

shader_reset();