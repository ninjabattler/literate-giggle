/// @description Remove 1 hp when stabbed

if (_can_be_stabbed) {
	_can_be_stabbed = false
	_hp -= 1.5;
	audio_play_sound(snd_enemy_stab, 0, false);
	
	_stab_flag_timer = 0.16667
}