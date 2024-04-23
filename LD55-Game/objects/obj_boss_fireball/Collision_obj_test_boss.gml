/// @description Insert description here
// You can write your code in this editor

if (_target_boss) {
	if(obj_test_boss._fireball_reflects > 0) {
		_target_boss = false;
		obj_test_boss._fireball_reflects--;
		
		global.game_speed = 0.1;
		_game_speed_reset_timer = 0.2;
		_game_slow_speed = true;
	} else {
		obj_test_boss._targetable = true;
		obj_test_boss._targetable_timer = 10;
		audio_play_sound(snd_enemy_hurt, 0, false);
		instance_destroy();
	}
}