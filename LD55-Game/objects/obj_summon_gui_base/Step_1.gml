/// @description Insert description here
// You can write your code in this editor

var _key_up = keyboard_check_pressed(ord("W"));
var _key_left = keyboard_check_pressed(ord("A"));
var _key_down = keyboard_check_pressed(ord("S"));
var _key_right = keyboard_check_pressed(ord("D"));

if(!global.summon_window_active) {
	summon_progress = 0;
}


if(global.active_summon == 0 && obj_stats_controller._player_souls >= cost) {
	// Await keyboard inputs to track arrows
	if(_key_up) {
		show_debug_message(global.active_arrow);
		if(summon_progress == global.active_arrow && summon_command[summon_progress] == "UP") {
		
			summon_progress++;
			if(summon_progress == array_length(summon_command)) {
				summon_complete = true;
				global.active_summon = summon_id;
				obj_stats_controller._player_souls -= cost;
				
				global.active_arrow = 0;
				global.summon_window_active = false;
				obj_summon_window.target_x = -obj_summon_window.sprite_width;
				obj_summon_window.expanding = false;
			}
		} else {
			for(var _i = 0; _i < array_length(summon_arrows); _i++) {
				summon_arrows[_i].disabled = true;
			}
		}
	} else if(_key_down) {
	
			if(summon_progress == global.active_arrow && summon_command[summon_progress] == "DOWN") {
			summon_progress++;
			if(summon_progress == array_length(summon_command)) {
				summon_complete = true;
				global.active_summon = summon_id;
				obj_stats_controller._player_souls -= cost;
				
				global.active_arrow = 0;
				global.summon_window_active = false;
				obj_summon_window.target_x = -obj_summon_window.sprite_width;
				obj_summon_window.expanding = false;
			}
		} else {
			for(var _i = 0; _i < array_length(summon_arrows); _i++) {
				summon_arrows[_i].disabled = true;
			}
		}
	} else if(_key_left) {
	
			if(summon_progress == global.active_arrow && summon_command[summon_progress] == "LEFT") {
			summon_progress++;
			if(summon_progress == array_length(summon_command)) {
				summon_complete = true;
				global.active_summon = summon_id;
				obj_stats_controller._player_souls -= cost;
				
				global.active_arrow = 0;
				global.summon_window_active = false;
				obj_summon_window.target_x = -obj_summon_window.sprite_width;
				obj_summon_window.expanding = false;
			}
		} else {
			for(var _i = 0; _i < array_length(summon_arrows); _i++) {
				summon_arrows[_i].disabled = true;
			}
		}
	} else if(_key_right) {
	
			if(summon_progress == global.active_arrow && summon_command[summon_progress] == "RIGHT") {
			summon_progress++;
			if(summon_progress == array_length(summon_command)) {
				summon_complete = true;
				global.active_summon = summon_id;
				obj_stats_controller._player_souls -= cost;
				
				global.active_arrow = 0;
				global.summon_window_active = false;
				obj_summon_window.target_x = -obj_summon_window.sprite_width;
				obj_summon_window.expanding = false;
			}
		} else {
			for(var _i = 0; _i < array_length(summon_arrows); _i++) {
				summon_arrows[_i].disabled = true;
			}
		}
	}
}