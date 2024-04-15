/// @description Insert description here
// You can write your code in this editor

#macro FIREBALL obj_fireball_summon
#macro ICEBLAST obj_iceblast_summon
#macro LIGHTNING obj_lightning_summon

// Define summon stats
global.fireball_range = 240;
global.iceblast_range = 200;
global.lightning_range = 300;

depth = -100;

// Set cursor
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

// Start music
audio_play_sound(snd_music_main, 1, true);

// Game states
global.game_paused = false;

// Black fade surface
global.paused_surf = -1;
exit_button = self;
resume_button = self;

// Summons setup
global.summons_list = []
array_push(global.summons_list, obj_fireball_summon_gui) 
array_push(global.summons_list, obj_iceblast_summon_gui) 
array_push(global.summons_list, obj_lightning_summon_gui) 