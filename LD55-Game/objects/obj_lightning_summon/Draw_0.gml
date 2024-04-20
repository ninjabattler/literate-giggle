/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_sprite_ext(spr_lightning_crystal, 0, x, y, 1, 1, crystal_rotation, c_white, 1);

// Do attack
if(attacking) {
	if(instance_exists(target)) {
		draw_line_width_colour(x, y, target.x, target.y, 5, c_white, c_purple);
		target._hp -= damage * global.game_speed * global.dt;
	}
}