/// @description Follow "parent" summon command

if (global.gamepad_active && gamepad_button_check_released(0, gp_face2)) {
	pressed = false;
}

x = parent_summon.x + 16 + 38*arrow_index;
y = parent_summon.y + 38;