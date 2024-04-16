/// @description Insert description here
// You can write your code in this editor

var _key_up = keyboard_check_pressed(ord("W"));
var _key_left = keyboard_check_pressed(ord("A"));
var _key_down = keyboard_check_pressed(ord("S"));
var _key_right = keyboard_check_pressed(ord("D"));

if(global.summon_window_active) {
	if(_key_up || _key_down || _key_left || _key_right) {
		global.active_arrow++;
	}
}