/// @description Insert description here
// You can write your code in this editor
global.show_options = !global.show_options;

if(instance_number(obj_music_slider) == 0) {
	instance_create_depth(1376, 448, -200, obj_music_slider);
	instance_activate_object(obj_music_slider)
}

if(instance_number(obj_sound_slider) == 0) {
	instance_create_depth(1376, 544, -200, obj_sound_slider);
	instance_activate_object(obj_sound_slider)
}