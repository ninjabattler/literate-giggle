/// @description Insert description here
// You can write your code in this editor
if (_target_boss != true) {
	audio_play_sound(snd_enemy_stab, 0, false);
	_target_boss = true;
}