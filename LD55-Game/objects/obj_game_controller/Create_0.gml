/// @description Insert description here
// You can write your code in this editor

// Start music
audio_play_sound(snd_music_main, 1, true);

// Game states
global.game_paused = false;

// Black fade surface
global.paused_surf = -1;

global.summons_list = []
array_push(global.summons_list, obj_fireball_summon_gui) 
array_push(global.summons_list, obj_lightning_summon_gui) 