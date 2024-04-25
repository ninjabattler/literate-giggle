/// @description Insert description here
// You can write your code in this editor
if (!_targetable) {
	draw_set_alpha(0.2);
	draw_circle_color(x, y, 100, c_aqua, c_aqua, false);
	draw_set_alpha(1);
}

var _arm_rotation_states = _arm_state_idle;

switch (_arm_state) {
	case "SPIN":
		_arm_rotation_states = _arm_state_spin;
		break;
}

for(var _i = 0; _i < array_length(_arm_rotation_states); _i++) {
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
	
	var _arm3 = spr_boss_1_arm_3_deactivated;
	
	if (_fireball_reflects >= _i && !_targetable) {
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