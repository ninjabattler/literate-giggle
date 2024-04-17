/// @description Insert description here
// You can write your code in this editor

_boss = obj_test_boss;
_target_boss = false;
_rotation = 0;
_target_rotation = 0;
_particle_system = part_system_create(prt_boss_fire);
audio_play_sound(snd_summon_shoot, 0, false);