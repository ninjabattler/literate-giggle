/// @description Insert description here
// You can write your code in this editor

if (_laser_timer > 0) {
	draw_set_color($FF91FF)
	draw_set_alpha(0.5);
	draw_line_width(x, y, x + 1920 * dcos(direction), y - 1920 * dsin(direction), 5);
} else {
	draw_set_color($FFFFFF)
	draw_line_width(x, y, x + 1920 * dcos(direction), y - 1920 * dsin(direction), _current_laser_width + 2);
	draw_set_color($FF91FF)
	draw_line_width(x, y, x + 1920 * dcos(direction), y - 1920 * dsin(direction), _current_laser_width);
}
draw_set_alpha(1);