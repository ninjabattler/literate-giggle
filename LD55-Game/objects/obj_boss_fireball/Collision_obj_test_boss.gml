/// @description Insert description here
// You can write your code in this editor

if (_target_boss) {
	obj_test_boss._hp -= 10;
	audio_play_sound(snd_enemy_hurt, 0, false);
	instance_destroy();
}