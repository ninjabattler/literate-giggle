/// @description Insert description here
// You can write your code in this editor
if (!_targetable) {
	draw_set_alpha(0.2);
	draw_circle_color(x, y, 78, $FF91FF, $FF91FF, false);
	
	draw_set_alpha(1);
	draw_sprite_ext(spr_boss_radius, 0, x, y, 1.5, 1.5, _shield_rotate, $FF91FF, 1);	
}

draw_self();