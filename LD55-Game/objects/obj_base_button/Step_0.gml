/// @description Insert description here

y = lerp(y, _target_y, _fall_speed);

if (global.gamepad_active) {
	if (global.gamepad_selection == _button_id) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}