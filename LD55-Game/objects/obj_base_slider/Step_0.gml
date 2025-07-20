/// @description Insert description here
// You can write your code in this editor

if (_dragging && mouse_x > x) {
	_current_percent = round(clamp(abs(x - mouse_x)/sprite_width, 0, 1) * 100);
} else if(_dragging && mouse_x < x) {
	_current_percent = 0;
}

if (global.show_options) {
	y = lerp(y, _target_y, 0.075);
} else {
	y = lerp(y, _starting_y, 0.075);
}

if (!global.show_options && y >= _target_y) {
	instance_destroy();
}