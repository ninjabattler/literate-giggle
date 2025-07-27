/// @description Insert description here
// You can write your code in this editor

for (_i = array_length(_curve_points_x) - 1; _i >= 0; _i--) {
	var _x1 = _curve_points_x[_i];
	var _y1 = _curve_points_y[_i];
	
	var _x2 = self.x;
	var _y2 = self.y;
	
	if (_i < array_length(_curve_points_x) - 1) {
		_x2 = _curve_points_x[_i + 1];
		_y2 = _curve_points_y[_i + 1];
	}
	
	draw_set_color(merge_color(#FF99FF, #FFFFFF, _i / (array_length(_curve_points_x) - 1)));
	draw_line_width(_x1, _y1, _x2, _y2, (_i / (array_length(_curve_points_x) - 1)) * 5);
}