/// @description Starts the next wave

if (_countdown == 0) {
	_wave_on_cooldown = false;
	start_wave();
} else {
	_countdown--;
	alarm_set(1, 60);
}