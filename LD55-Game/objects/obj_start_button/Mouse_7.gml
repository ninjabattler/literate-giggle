/// @description Insert description here
// You can write your code in this editor

if(room == room_first) {
	room_goto_next()
	audio_stop_sound(snd_music_title);
	audio_play_sound(snd_music_main,0, true);
}