/// @description Open summon menu

if (global.gamepad_active && gamepad_button_check_pressed(0, gp_face2)) {
	instance_create_depth(x, y, 0, obj_summon_placer);

	if(global.active_summon == 0) {
		global.summon_window_active = true;
	}
}
