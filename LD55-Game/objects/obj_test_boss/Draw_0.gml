/// @description Insert description here
// You can write your code in this editor
if (!_targetable) {
	draw_set_alpha(0.2);
	draw_circle_color(x, y, 100, c_aqua, c_aqua, false);
	draw_set_alpha(1);
}

for(var _i = 0; _i < array_length(_arm_state_idle); _i++) {
	var _arm_rotation_1 = _arm_state_idle[_i]._arm_rot_1 + _arm_rotation_offset;
	var _arm_rotation_2 = _arm_state_idle[_i]._arm_rot_2 + _arm_rotation_offset;
	var _arm3 = spr_boss_1_arm_3_deactivated;
	
	if (_current_phase > _i) {
		_arm3 = spr_boss_1_arm_3;
	}
	
	draw_sprite_ext(spr_boss_1_arm_1, 0, x, y, 1, 1, image_angle + _arm_rotation_1, c_white, 1);
	draw_sprite_ext(spr_boss_1_arm_2, 0, x + 56 * dcos(image_angle + _arm_rotation_1), y - 56 * dsin(image_angle + _arm_rotation_1), 1, 1, image_angle - _arm_rotation_2, c_white, 1);
	draw_sprite_ext(_arm3, 0, (x + 56 * dcos(image_angle + _arm_rotation_1)) + 56 * dcos(image_angle - _arm_rotation_2), (y - 56 * dsin(image_angle + _arm_rotation_1)) - 56 * dsin(image_angle - _arm_rotation_2), 1, 1, image_angle + 30, c_white, 1);
}

draw_self();

if (!_targetable) {
	draw_sprite_ext(spr_boss_1_radius, image_index, x, y, 1.2 + _shield_scale_offset, 1.2 + _shield_scale_offset, _shield_rotate, c_white, 1);	
}