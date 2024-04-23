/// @description Insert description here
event_inherited();

if (global.gamepad_active) {
	if (global.gamepad_selection == _button_id && gamepad_button_check_pressed(0, gp_face1)) {
		global.show_options = !global.show_options;
	}
}
