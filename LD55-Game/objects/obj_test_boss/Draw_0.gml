/// @description Insert description here
// You can write your code in this editor
if (!_invisible) {
	
	draw_set_alpha(_shield_alpha / 5);
	draw_circle_color(x, y, 100 * (1 + _shield_scale_offset), c_aqua, c_aqua, false);
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
	
		var _arm_base_1 = image_angle;
		var _arm_base_2 = image_angle;
		var _arm_base_3 = image_angle;
	
		if (_arm_state == "STRETCHED" || _arm_state == "DOUBLE_LASER") {
			_arm_base_1 = -90;	
			_arm_base_2 = -90;	
			_arm_base_3 = -90;	
		}
	
		if (_arm_state == "SINGLE_LASER") {
			_arm_base_1 = -90;	
		}
	
		var _arm_off_1_x = _arm_position_offsets[_i][0] * dcos(_arm_base_1);
		var _arm_off_1_y = _arm_position_offsets[_i][0] * dsin(_arm_base_1);
		var _arm_off_2_x = _arm_position_offsets[_i][1] * dcos(_arm_base_2 + _arm_rotation_1);
		var _arm_off_2_y = _arm_position_offsets[_i][1] * dsin(_arm_base_2 + _arm_rotation_1);
		var _arm_pos_3_x = _arm_position_offsets[_i][2] * dcos(_arm_base_3 + _arm_rotation_2);
		var _arm_pos_3_y = _arm_position_offsets[_i][2] * dsin(_arm_base_3 + _arm_rotation_2);
	
		var _arm_base = _arm_base_1;
	
		if (_i = 1) {
			_arm_base = _arm_base_2;	
		}
	
		if (_i = 2) {
			_arm_base = _arm_base_3;	
		}
	
		if (!_arm_piece_destroyed[_i][0]) {
			draw_sprite_ext(spr_boss_1_arm_1, image_index, x + _arm_off_1_x, y - _arm_off_1_y, 0.515, 0.515, _arm_base + _arm_rotation_1, c_white, 1);
		}
	
		if (!_arm_piece_destroyed[_i][1]) {
			draw_sprite_ext(spr_boss_1_arm_2, image_index, x + _arm_off_2_x + 56 * dcos(_arm_base + _arm_rotation_1), y - _arm_off_2_y - 56 * dsin(_arm_base + _arm_rotation_1), 0.515, 0.515, _arm_base - _arm_rotation_2, c_white, 1);
		}
	
		if (!_arm_piece_destroyed[_i][2]) {
			draw_sprite_ext(_arm3, 0, (x + _arm_pos_3_x + 56 * dcos(_arm_base + _arm_rotation_1)) + 56 * dcos(_arm_base - _arm_rotation_2), (y - _arm_pos_3_x - 56 * dsin(_arm_base + _arm_rotation_1)) - 56 * dsin(_arm_base - _arm_rotation_2), 0.5, 0.5,  _arm_base - _arm_rotation_2 + 30, c_white, 1);
		}
	}
	draw_sprite_ext(sprite_index, image_index, x ,y, 0.325, 0.325, image_angle, c_white, 1);
	
	draw_sprite_ext(spr_boss_1_radius, _shield_index, x, y, (1.2 + _shield_scale_offset) * 0.415, (1.2 + _shield_scale_offset) * 0.415, _shield_rotate, c_white, _shield_alpha);

	draw_set_alpha(1);

	if (_attacking) {
		draw_set_font(fnt_griffy_small);
		draw_set_valign(fa_bottom);
		var _box_width = string_width(_attack_name);
		var _box_height = string_height(_attack_name);
		var _text_y = y - 130;
	
		if (y < room_height / 2) {
			draw_set_valign(fa_top);
			_text_y = y + 130;
		}
	
		draw_set_color(#FF91FF);
		draw_rectangle(x - (_box_width / 2), _text_y, x + (_box_width / 2), _text_y, false);
		draw_text_ext_colour(x, _text_y, _attack_name, _box_height, _box_width, c_white, c_white, #FF91FF, #FF91FF, 1);
	}
}