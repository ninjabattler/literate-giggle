/// @description Insert description here
// You can write your code in this editor

event_inherited();
draw_sprite_ext(spr_lightning_crystal, 0, x, y, 1, 1, crystal_rotation, c_white, 1);

// Do attack
if(attacking) {
	if(instance_exists(target) && target._targetable) {
		target._hp -= damage * global.game_speed * global.dt;
		
		if (lightning_framerate == 0) {
			lightning_target_x = target.x;
			lightning_target_y = target.y;
			lightning_framerate = 2;
		} else {
			lightning_framerate--;

		}
		
		// Shoot lightning at primary target
		draw_lightning(x, y, lightning_target_x, lightning_target_y, true, c_purple, lightning_seed);
		
		// Arc to nearby enemies
		if(random(1) < 0.5) {
			var _target1 = instance_nth_nearest(lightning_target_x, lightning_target_y, obj_base_enemy, 2);
			draw_lightning(lightning_target_x, lightning_target_y, _target1.x, _target1.y, true, c_purple, lightning_seed);
		}
	}
}