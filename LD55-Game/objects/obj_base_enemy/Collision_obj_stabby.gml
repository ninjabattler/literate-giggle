/// @description Remove 1 hp when stabbed

if (_can_be_stabbed) {
	_can_be_stabbed = false
	_hp -= 1.5;
	
	alarm_set(0, 10);
}