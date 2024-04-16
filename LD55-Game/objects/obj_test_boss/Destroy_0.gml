/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_boss_killed, 0, false);
instance_create_depth(self.x, self.y, 0, obj_soul);
instance_create_depth(self.x-5, self.y+5, 0, obj_soul);
instance_create_depth(self.x+5, self.y-5, 0, obj_soul);