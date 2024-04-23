/// @description Insert description here

// Get delta time
global.dt = delta_time / 1000000;

if room != TitleRoom {
	if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
		
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
	instance_destroy(options_button);
}

audio_group_set_gain(music, global.music_volume / 100, 0);
audio_group_set_gain(soundEffects, global.sound_effect_volume / 100, 0);