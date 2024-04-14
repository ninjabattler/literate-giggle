/// @description Insert description here
// You can write your code in this editor
obj_stats_controller._player_souls++;
audio_play_sound(snd_soul_pickup, 0, false);
instance_destroy();