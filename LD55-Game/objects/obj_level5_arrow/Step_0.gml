if (_move_to_target) {
	x = lerp(x, _target_x, 0.025);
} else {
	x = lerp(x, _start_x, 0.025);
}

if (obj_level5_spawner._current_wave != 0) {
	instance_destroy();
}