/// @description Insert description here
// You can write your code in this editor
global.dt = delta_time / 1000000;

if room != TitleRoom {
	if keyboard_check_pressed(vk_escape) {
		
		global.game_paused = !global.game_paused;
		if(global.game_paused == false) {
			instance_destroy(resume_button)
			instance_activate_all();
			surface_free(global.paused_surf);
			global.paused_surf = -1;
		}
	}
}

if(global.game_paused == false && resume_button != self) {
	instance_destroy(resume_button);
	instance_destroy(exit_button);
}