/// @description Insert description here
// You can write your code in this editor

if (!_stab_on_cooldown && !_disabled) {
	var _stabby = instance_create_depth(self.x, self.y, 101, obj_stabby);
	_stab_on_cooldown = true;
	alarm_set(0, _stab_cooldown);
}