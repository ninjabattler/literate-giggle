/// @description Insert description here
// You can write your code in this editor

var _key_up = keyboard_check_pressed(ord("W"));
var _key_left = keyboard_check_pressed(ord("A"));
var _key_down = keyboard_check_pressed(ord("S"));
var _key_right = keyboard_check_pressed(ord("D"));

if (global.summon_window_active) {
	if (_key_up || _key_down || _key_left || _key_right) {
		global.active_arrow++;
	}
	
	if (global.gamepad_active) {
		var _pad_up = gamepad_button_check_pressed(0, gp_padu);
		var _pad_left = gamepad_button_check_pressed(0, gp_padl);
		var _pad_down = gamepad_button_check_pressed(0, gp_padd);
		var _pad_right = gamepad_button_check_pressed(0, gp_padr);
		
		if (_pad_up || _pad_left || _pad_down || _pad_right) {
			global.active_arrow++;	
		}
	}
}