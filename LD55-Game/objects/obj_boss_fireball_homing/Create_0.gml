/// @description Insert description here
// You can write your code in this editor

_boss = obj_test_boss;
_target_boss = false;
_rotation = 0;
_target_rotation = 0;
_speed_up = false;
//_particle_update_timer=0.0166666667;
_particle_system2 = part_system_create(prt_boss_fire_glare);
_particle_system = part_system_create(prt_boss_fire);
part_system_global_space(_particle_system, true);
alarm_set(0, 600);

// Timers
_game_slow_speed = false;
_game_speed_reset_timer = 0;
_zoom_blur = 0;
_zoom_unblur = false;
_particle_update_timer = 0;
_rotation_speed = 0;
_max_rotation_speed = 5;

_current_speed = 10;
_max_speed = 150;

if (point_direction(x, y, obj_player.x, obj_player.y) < direction) {
	_max_rotation_speed = -5;
}