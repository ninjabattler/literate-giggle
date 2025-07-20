/// @description Insert description here
// You can write your code in this editor
global.music_volume = 100;
global.sound_effect_volume = 100;
audio_group_load(soundEffects)
audio_group_load(music)

depth = -100;

global.show_options = false;

// Global Speed
global.game_speed = 1;
global.dt = delta_time / 1000000;

// Global Colours
global.text_color = #e3b669;
global.hp_color = #f04c4c;

// Gamepad settings
global.gamepad_active = false;
global.gamepad_selection = 0;
global.gamepad_selection_max = 1;
global.gamepad_selection_min = 0;
gamepad_set_axis_deadzone(0, 0.15);
joystick_flick_ready = true;

// Set cursor
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

// Start title music
alarm_set(0, 5);

// Game states
global.game_paused = false;
global.summon_placement_x = 0;
global.summon_placement_y = 0;

// Black fade pause surface
global.paused_surf = -1;
exit_button = self;
resume_button = self;
options_button = self;

#macro FIREBALL obj_fireball_summon
#macro ICEBLAST obj_iceblast_summon
#macro LIGHTNING obj_lightning_summon

// Define summon stats
global.fireball_range = 240;
global.iceblast_range = 200;
global.lightning_range = 300;

// Summons setup
global.summons_list = []
array_push(global.summons_list, obj_fireball_summon_gui) 
array_push(global.summons_list, obj_iceblast_summon_gui) 
array_push(global.summons_list, obj_lightning_summon_gui) 