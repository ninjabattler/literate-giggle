/// @description Remove 1 hp when stabbed

if (_can_be_stabbed) {
	image_blend = #ffbbbb;
	alarm_set(3, 10);
	
	_can_be_stabbed = false
	_hp -= 1.5;
	audio_play_sound(snd_enemy_stab, 0, false);
	
	alarm_set(0, 10);
}