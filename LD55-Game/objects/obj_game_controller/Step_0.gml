/// @description Insert description here
// You can write your code in this editor
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