/// @description Insert description here
// You can write your code in this editor

// Set global spawn positions to the spawner's position
global.spawn_x = self.x;
global.spawn_y = self.y;

_current_wave = 0;
_waves = [
	tl_test_wave_1,
	tl_test_wave_2
]

function start_wave () {
	if (_current_wave < array_length(_waves)) {
		timeline_index = _waves[_current_wave];
		timeline_speed = 1;
		timeline_running = true;
		timeline_position = 0;
		
		_current_wave++;
		alarm_set(0, timeline_max_moment(timeline_index));
	}
}

start_wave();