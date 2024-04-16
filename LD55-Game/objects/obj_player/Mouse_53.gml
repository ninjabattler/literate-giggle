/// @description Insert description here
// You can write your code in this editor

if(global.active_summon != 0) {
	// Check if colliding
	if(_nearest_summon_dist > 96 && global._can_place) {
		instance_create_depth(x + _x_offset, y + _y_offset, 10, global.active_summon);
		global.active_summon = 0;
		if(instance_exists(obj_summon_placer)) {
			instance_destroy(obj_summon_placer);
		}
	} else {
		audio_play_sound(snd_summon_obstruction, 0, false);
	}
} else if (!_stab_on_cooldown && !_disabled) {
	var _stabby = instance_create_depth(self.x, self.y, 101, obj_stabby);
	_stab_on_cooldown = true;
	image_index = 1;
	alarm_set(0, _stab_cooldown);
}