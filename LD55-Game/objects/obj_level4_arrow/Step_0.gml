if (_move_to_target) {
	y = lerp(y, _target_y, 0.025);
} else {
	y = lerp(y, _start_y, 0.025);
}

if (obj_level4_spawner._current_wave != 0) {
	instance_destroy();
}