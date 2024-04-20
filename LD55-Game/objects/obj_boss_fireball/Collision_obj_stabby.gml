/// @description Insert description here
// You can write your code in this editor
if (_target_boss != true) {
	audio_play_sound(snd_enemy_stab, 0, false);
	_target_boss = true;
	global.game_speed = 0.1;
	_game_speed_reset_timer = 0.2;
	_game_slow_speed = true;
}