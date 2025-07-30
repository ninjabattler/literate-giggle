draw_set_font(fnt_griffy)
display_set_gui_size(1920, 1080);

if(global.game_paused == true) {
	if(!surface_exists(global.paused_surf)) {
	    if(global.paused_surf == -1) {
			instance_deactivate_all(true);
	    }
	    global.paused_surf = surface_create(room_width, room_height);
	    surface_set_target(global.paused_surf);
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
		
		resume_button = instance_create_depth(room_width / 2, 512, -200, obj_resume_button);
		resume_button._button_id = 0;
		options_button = instance_create_depth(room_width / 2, 704, -200, obj_options_button);
		options_button._button_id = 2;
		exit_button = instance_create_depth(room_width / 2, 896, -200, obj_exit_button);
		exit_button._button_id = 1;

	} else {
		// Draw paused background
	    draw_surface(global.paused_surf, 0, 0);
	    draw_set_alpha(0.5);
	    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	    draw_set_alpha(1);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
		draw_sprite(spr_gui_title, 0, room_width / 2, 300);
		draw_set_font(fnt_griffy_title);
	    draw_set_valign(fa_bottom);
	    draw_text_transformed_colour(room_width / 2, 300, "Paused", 1, 1, 0, global.text_color, global.text_color, global.text_color, global.text_color, 1);
		draw_set_font(fnt_griffy);
	    draw_set_halign(fa_left);
    }
}