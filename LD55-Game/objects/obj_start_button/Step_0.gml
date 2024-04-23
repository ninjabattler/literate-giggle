/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (global.gamepad_active) {
	if (global.gamepad_selection == _button_id && gamepad_button_check_pressed(0, gp_face1)) {
		if(room == room_first) {
			room_goto_next()
			audio_stop_sound(snd_music_title);
			audio_play_sound(snd_music_main,0, true);
		}
	}
}