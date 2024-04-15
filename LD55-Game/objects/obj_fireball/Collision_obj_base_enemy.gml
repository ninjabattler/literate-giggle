/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_enemy_hurt, 0, false);
other._hp -= _damage;
instance_destroy(self);