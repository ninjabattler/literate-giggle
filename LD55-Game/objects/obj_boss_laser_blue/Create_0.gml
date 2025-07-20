/// @description Insert description here
// You can write your code in this editor

_boss = obj_test_boss;
_target_boss = false;
_rotation = 0;
_target_rotation = 0;
//_particle_update_timer=0.0166666667;
_particle_system = part_system_create(prt_boss_laser_blue_glare);
_particle_system2 = 0;

// Timers
_game_slow_speed = false;
_game_speed_reset_timer = 0;
_zoom_blur = 0;
_zoom_unblur = false;
_particle_update_timer = 0;

_laser_timer = 2;
_current_laser_width = 0;
_target_laser_width = 10;

_sound_played = false;
_player_damaged = false;