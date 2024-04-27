/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(_shield_alpha / 5);
draw_circle_color(x, y, 100, c_aqua, c_aqua, false);
draw_set_alpha(1);

var _arm_rotation_states = _arm_state_idle;

switch (_arm_state) {
	case "SPIN":
		_arm_rotation_states = _arm_state_spin;
		break;
}

for(var _i = 0; _i < array_length(_arm_rotation_states); _i++) {
	// Get the rotation offsets for the wiggle/spinning animation
	var _arm_rotation_1 = _arm_1_1_rotation + _arm_1_1_rotation_offset;
	var _arm_rotation_2 = _arm_1_2_rotation + _arm_1_2_rotation_offset;
	
	if (_i = 1) {
		_arm_rotation_1 = _arm_2_1_rotation + _arm_2_1_rotation_offset;
		_arm_rotation_2 = _arm_2_2_rotation + _arm_2_2_rotation_offset;
	}
	
	if (_i = 2) {
		_arm_rotation_1 = _arm_3_1_rotation + _arm_3_1_rotation_offset;
		_arm_rotation_2 = _arm_3_2_rotation + _arm_3_2_rotation_offset;
	}
	
	// Set the arm's crystals to be deactivated or not
	var _arm3 = spr_boss_1_arm_3_deactivated;
	if (_fireball_reflects >= _i && !_targetable) {
		_arm3 = spr_boss_1_arm_3;
	}
	
	var _arm_off_1_x = _arm_position_offsets[_i][0] * dcos(image_angle);
	var _arm_off_1_y = _arm_position_offsets[_i][0] * dsin(image_angle);
	var _arm_off_2_x = _arm_position_offsets[_i][1] * dcos(image_angle + _arm_rotation_1);
	var _arm_off_2_y = _arm_position_offsets[_i][1] * dsin(image_angle + _arm_rotation_1);
	var _arm_pos_3_x = _arm_position_offsets[_i][2] * dcos(image_angle + _arm_rotation_2);
	var _arm_pos_3_y = _arm_position_offsets[_i][2] * dsin(image_angle + _arm_rotation_2);
	
	draw_sprite_ext(spr_boss_1_arm_1, image_index, x + _arm_off_1_x, y - _arm_off_1_y, 1, 1, image_angle + _arm_rotation_1, c_white, 1);
	draw_sprite_ext(spr_boss_1_arm_2, image_index, x + _arm_off_2_x + 56 * dcos(image_angle + _arm_rotation_1), y - _arm_off_2_y - 56 * dsin(image_angle + _arm_rotation_1), 1, 1, image_angle - _arm_rotation_2, c_white, 1);
	draw_sprite_ext(_arm3, 0, (x + _arm_pos_3_x + 56 * dcos(image_angle + _arm_rotation_1)) + 56 * dcos(image_angle - _arm_rotation_2), (y - _arm_pos_3_x - 56 * dsin(image_angle + _arm_rotation_1)) - 56 * dsin(image_angle - _arm_rotation_2), 1, 1,  image_angle - _arm_rotation_2 + 30, c_white, 1);
}

draw_self();

draw_sprite_ext(spr_boss_1_radius, image_index, x, y, 1.2 + _shield_scale_offset, 1.2 + _shield_scale_offset, _shield_rotate, c_white, _shield_alpha);	