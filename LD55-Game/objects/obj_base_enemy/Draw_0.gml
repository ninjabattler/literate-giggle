/// @description Insert description here
// You can write your code in this editor
//draw_self();

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, image_angle, _image_tint, 1);

draw_healthbar(x - 16, y + 24, x + 16, y + 30, (_hp / _max_hp) * 100, c_black, global.hp_color, global.hp_color, 0, true, false);