/// @description Insert description here

// Set global spawn positions to the spawner's position
global.spawn_x = self.x;
global.spawn_y = self.y;

_current_wave = 0;
_wave_timeline_complete = false;
_waves = [];
_wave_on_cooldown = false;
_countdown = 0;
_cooldown_drop = -300;
_cooldown_current_y = -300;

function start_wave () {
	if (_current_wave < array_length(_waves)) {
		timeline_index = _waves[_current_wave];
		timeline_speed = 1;
		timeline_running = true;
		timeline_position = 0;
		
		_current_wave++;
		alarm_set(2, timeline_max_moment(timeline_index));
	}
}