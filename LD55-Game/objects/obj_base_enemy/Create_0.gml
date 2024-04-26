/// @description Initializes the enemy
_can_be_stabbed = true;
_hp = _max_hp;
_heal_cooldown = false;
_slowed = false;
_speed *= global.game_speed;
_image_tint = #ffffff;

if(room == Level1) {
	init_enemy(_speed, pth_level_1);
}
else if(room == Level2) {
	init_enemy(_speed, pth_level_2);
}
else if(room == Level3) {
	init_enemy(_speed, pth_level_3);
}
else if(room == Level4) {
	init_enemy(_speed, pth_level_4);
}
else if(room == Level5) {
	var _rand = random_range(-1, 1);
	
	if (_rand < 0) {
		init_enemy(_speed, pth_level_5);
	} else {
		init_enemy(_speed, pth_level_5_2);
	}
}

// Timers
_stab_flag_timer = 0;
_heal_cooldown_timer = 0;
_speed_reset_timer = 0;