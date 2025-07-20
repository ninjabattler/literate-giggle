/// @description Insert description here
// You can write your code in this editor

draw_text(500, 500, lightning_seed);

// Do attack
if (attacking) {
	if(instance_exists(target)) {
		//target._hp -= damage * global.game_speed * global.dt;
		
		if (lightning_framerate == 0) {
			//lightning_target_x = target.x;
			//lightning_target_y = target.y;
			//random_set_seed(random_range(1, 10000))
			lightning_seed = random_range(1, 10000);
			lightning_framerate = 4;
		} else {
			lightning_framerate--;

		}
		
		// Shoot lightning at primary target
		draw_lightning(x, y, target.x, target.y, true, c_purple, lightning_seed);
		
		// Arc to nearby enemies
		//if(random(1) < 0.5) {
		//	var _target1 = instance_nth_nearest(lightning_target_x, lightning_target_y, obj_base_enemy, 2);
		//	draw_lightning(lightning_target_x, lightning_target_y, _target1.x, _target1.y, true, c_purple, lightning_seed);
		//}
	}
}