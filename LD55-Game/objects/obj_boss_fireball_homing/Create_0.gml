/// @description Insert description here
// You can write your code in this editor

_boss = obj_test_boss;
_target_boss = false;
_rotation = 0;
_target_rotation = 0;
//_particle_update_timer=0.0166666667;
_particle_system = part_system_create(prt_boss_fire);
_particle_system2 = part_system_create(prt_boss_fire_glare);
part_system_global_space(_particle_system, true);

// Timers
_game_slow_speed = false;
_game_speed_reset_timer = 0;
_zoom_blur = 0;
_zoom_unblur = false;
_particle_update_timer = 0;

_current_speed = 0.1;
_max_speed = 200;