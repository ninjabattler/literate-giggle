/// @description Insert description here
// You can write your code in this editor

if(!_heal_cooldown) {
	if (_hp < _max_hp) {
		_hp++;
		_heal_cooldown = true;	
		alarm_set(2, 60);
	}
}