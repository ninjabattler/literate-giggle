/// @description Insert description here
// You can write your code in this editor

if (_dragging && mouse_x > x) {
	_current_percent = round(clamp(abs(x - mouse_x)/sprite_width, 0, 1) * 100);
} else if(_dragging && mouse_x < x) {
	_current_percent = 0;
}