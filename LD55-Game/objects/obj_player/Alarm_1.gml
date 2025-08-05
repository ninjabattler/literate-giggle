/// @description Dash timer
// You can write your code in this editor

if (_dash_count < _dash_max_count) {
	_dash_count++;
	if (_dash_count < _dash_max_count) {
		alarm_set(1, 60);	
	}
}