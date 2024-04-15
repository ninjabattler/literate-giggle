/// @description Insert description here
// You can write your code in this editor

if(global.active_summon != 0) {
	// Check if colliding
	if(_nearest_summon_dist > 96 && global._can_place) {
		instance_create_depth(x + _x_offset, y + _y_offset, 10, global.active_summon);
		global.active_summon = 0;
	} else {
		audio_play_sound(snd_summon_obstruction, 0, false);
	}
} else if (!_stab_on_cooldown && !_disabled) {
	var _stabby = instance_create_depth(self.x, self.y, 101, obj_stabby);
	_stab_on_cooldown = true;
	alarm_set(0, _stab_cooldown);
}