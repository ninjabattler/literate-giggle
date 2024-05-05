/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_boss_killed, 0, false);
for (var _i = 0; _i < 55; _i++) {
	var _soul = instance_create_depth(self.x, self.y, 0, obj_soul);
	_soul.speed = random_range(3, 9);
	_soul.alarm[1] = random_range(30, 45);
}