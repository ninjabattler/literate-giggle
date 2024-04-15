/// @description Insert description here
// You can write your code in this editor

if (_player_health <= 0 && !obj_player._disabled) {
	obj_player._disabled = true;
	
	instance_create_depth(960, 540, -100, obj_restart_button);
	instance_create_depth(960, 740, -100, obj_exit_button);
}