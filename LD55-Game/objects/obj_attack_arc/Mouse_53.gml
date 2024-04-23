/// @description Insert description here
// You can write your code in this editor

if (_can_switch) {
	if (_side == "LEFT") {
		_side = "RIGHT";	
		_can_switch = false;
		_target_dir_offset = 45;
		alarm_set(0, 20);
	} else {
		_side = "LEFT";	
		_can_switch = false;
		_target_dir_offset = -45;
		alarm_set(0, 20);
	}
}