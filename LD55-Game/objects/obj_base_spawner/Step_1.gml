/// @description Handle gamepad input

if (global.gamepad_active && gamepad_button_check_pressed(0, gp_face4)) {
	if (_wave_on_cooldown == true) {
		_countdown = 0;
	}
}