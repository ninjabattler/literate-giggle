/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_healthbar(x - 16, y + 24, x + 16, y + 30, (_hp / _max_hp) * 100, c_black, global.hp_color, global.hp_color, 0, true, false);