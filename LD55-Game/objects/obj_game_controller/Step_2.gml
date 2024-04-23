/// @description Handle gamepad inputs

// Check for gamepad nav inputs
// Only do any of this work if game is paused, not needed during gameplay
if (global.gamepad_active && (room == TitleRoom || global.game_paused)) {
	if (gamepad_button_check_pressed(0, gp_padu)) {
		global.gamepad_selection--;
		audio_play_sound(snd_click_soft, 10, 0);
	}
	
	if (gamepad_button_check_pressed(0, gp_padd)) {
		global.gamepad_selection++;
		audio_play_sound(snd_click_soft, 10, 0);
	}
	
	// Monitor joystick movement
	if (gamepad_axis_value(0, gp_axislv) < -0.8 && joystick_flick_ready) {
		global.gamepad_selection--;
		joystick_flick_ready = false;
		audio_play_sound(snd_click_soft, 10, 0);
	}
	
	if (gamepad_axis_value(0, gp_axislv) > 0.8 && joystick_flick_ready) {
		global.gamepad_selection++;
		joystick_flick_ready = false;
		audio_play_sound(snd_click_soft, 10, 0);
	}
	
	if (abs(gamepad_axis_value(0, gp_axislv)) < gamepad_get_axis_deadzone(0)) {
		joystick_flick_ready = true;
	}
	
	// Loop back menu
	if (global.gamepad_selection > global.gamepad_selection_max) {
		global.gamepad_selection = global.gamepad_selection_min;
	} else if (global.gamepad_selection < global.gamepad_selection_min) {
		global.gamepad_selection = global.gamepad_selection_max;	
	}
}

// Check if gamepad is active
if (!global.gamepad_active) {
	for (var _i = gp_face1; _i < gp_axisrv; _i++) {
		if (gamepad_button_check( 0, _i )) {
			cursor_sprite = -1;
			global.gamepad_active = true;
		}
	}	
}