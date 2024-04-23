/// @description Insert description here
// You can write your code in this editor
draw_self()

draw_text(500, 600,  abs(_momentum_x));

// Project summons
if(global.active_summon != 0) {
	
	var _mouse_direction = point_direction(x, y, window_mouse_get_x(), window_mouse_get_y());
	var _mouse_distance = point_distance(x, y, window_mouse_get_x(), window_mouse_get_y());
	var _projection_dist = clamp(_mouse_distance, 60, 150);
	
	_x_offset = lengthdir_x(_projection_dist, _mouse_direction);
	_y_offset = lengthdir_y(_projection_dist, _mouse_direction);
	
	var _project_x = x + _x_offset;
	var _project_y = y + _y_offset;
	
	global.summon_placement_x = _project_x;
	global.summon_placement_y = _project_y;
	
	var _nearest_summon = instance_nearest(_project_x, _project_y, obj_summon_base);
	if(instance_exists(_nearest_summon)) {
		_nearest_summon_dist = point_distance(_project_x, _project_y, _nearest_summon.x, _nearest_summon.y);
		
		if(_nearest_summon_dist > global.active_summon.sprite_width + 32 && global._can_place) {
			draw_sprite_ext(global.active_summon.sprite_index, 0, _project_x, _project_y, 1, 1, 0, c_white, 0.5);
			draw_set_alpha(0.4);
			draw_set_circle_precision(64);
			draw_circle_color(_project_x, _project_y, global.active_summon.max_range, c_green, c_lime, false);
			draw_set_alpha(1);
		} else {
			draw_sprite_ext(global.active_summon.sprite_index, 0, _project_x, _project_y, 1, 1, 0, c_red, 0.5);
		}
	} else if(instance_exists(global.active_summon)) {
		draw_sprite_ext(global.active_summon.sprite_index, 0, _project_x, _project_y, 1, 1, 0, c_white, 0.5);
	}
}