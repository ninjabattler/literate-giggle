/// @description Insert description here
// You can write your code in this editor

//panning
//when the mouse button is pressed, it captures the values of the mouse's X and Y position.
//Because the view is going to be moved, we want the position of the mouse in relation to
// the window, not the view.
//if keyboard_check_pressed(vk_control)
//{
//mouse_xstart = window_views_mouse_get_x();
//mouse_ystart = window_views_mouse_get_y();
//}

//so long as the mouse button is held down, the X and Y coordinate of the view will change to
// be the difference between the mouse's current position and the position it was when we started.
//if keyboard_check(vk_control)
//{
//view_xview += mouse_xstart - window_views_mouse_get_x();
//view_yview += mouse_ystart - window_views_mouse_get_y();
//}

if (global.gamepad_active && gamepad_button_check_pressed(0, gp_shoulderrb)) {
	if(global.active_summon != 0) {
		// Check if colliding
		if(_nearest_summon_dist > 96 && global._can_place) {
			instance_create_depth(x + _x_offset, y + _y_offset, 10, global.active_summon);
			global.active_summon = 0;
			if(instance_exists(obj_summon_placer)) {
				instance_destroy(obj_summon_placer);
			}
		} else {
			audio_play_sound(snd_summon_obstruction, 0, false);
		}
	} else if (!_stab_on_cooldown && !_disabled) {
		var _stabby = instance_create_depth(self.x, self.y, 101, obj_stabby);
		_stab_on_cooldown = true;
		image_index = 1;
		alarm_set(0, _stab_cooldown);
	}
}


//zooming
if mouse_wheel_up()
{
	if(view_hview > camera_min_h) {
		//establish values of the view's current scale for reference
		var _prev_view_x = view_wview;
		var _prev_view_y = view_hview;
		//increase the view scale based on our zoom_speed variable. Dividing the value based on
		//the original X and Y scales of the view ensure that the aspect ratio remains consistent.
		view_hview -= window_max_h/zoom_speed;
		view_wview -= window_max_w/zoom_speed;
		//we now want the view to zoom in towards the center of the view as opposed to the top
		//left corner as it would natural want to do.
		view_xview += abs(view_wview-_prev_view_x)/2;
		view_yview += abs(view_hview-_prev_view_y)/2;
	}
}

//and just repeat the same code for zooming out only reverse the math.
if mouse_wheel_down()
{
	if(view_hview < window_max_h) {
		var _prev_view_x = view_wview;
		var _prev_view_y = view_hview;
		view_hview += window_max_h/zoom_speed;
		view_wview += window_max_w/zoom_speed;
		view_xview -= abs(view_wview-_prev_view_x)/2;
		view_yview -= abs(view_hview-_prev_view_y)/2;
	}
}

// Smoothly adjust camera height
current_xview = lerp(current_xview, view_xview, 0.1);
current_yview = lerp(current_yview, view_yview, 0.1);
current_hview = lerp(current_hview, view_hview, 0.1);
current_wview = lerp(current_wview, view_wview, 0.1);

//camera_set_view_pos(camera,current_xview,current_yview);
camera_set_view_size(camera,current_wview,current_hview);
camera_set_view_border(camera, current_wview/2, current_hview/2);