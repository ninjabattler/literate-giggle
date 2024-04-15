if(global.game_paused == true) {
	if(!surface_exists(global.paused_surf)) {
	    if(global.paused_surf == -1) {
			instance_deactivate_all(true);
	    }
	    global.paused_surf = surface_create(room_width, room_height);
	    surface_set_target(global.paused_surf);
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
		
		resume_button = instance_create_depth(room_width / 2, room_height / 2, -200, obj_resume_button);
		exit_button = instance_create_depth(room_width / 2, room_height / 2 + 96, -200, obj_exit_button);
	} else {
		// Draw paused background
	    draw_surface(global.paused_surf, 0, 0);
	    draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
	    draw_set_halign(fa_center);
	    draw_text_transformed_colour(room_width / 2, room_height / 3, "PAUSED", 3, 3, 0, c_white, c_white, c_white, c_white, 1);
	    draw_set_halign(fa_left);
    }
}