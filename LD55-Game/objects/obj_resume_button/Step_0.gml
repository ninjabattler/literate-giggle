/// @description Insert description here
event_inherited();

if (global.gamepad_active) {
	if (global.gamepad_selection == _button_id && gamepad_button_check_pressed(0, gp_face1)) {
		global.game_paused = false;
		instance_activate_all();
		surface_free(global.paused_surf);
		global.paused_surf = -1;
	}
}