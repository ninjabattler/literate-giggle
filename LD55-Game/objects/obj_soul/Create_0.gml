/// @description Insert description here
// You can write your code in this editor
_enemy_to_follow = obj_test_enemy_thiefy;
_follow = false;
_random_direction = random_range(0, 360);
_deceleration = random_range(0.075, 0.15);
_follow_player = false;
_fading_out = false;
_glare = part_system_create(prt_soul_glare);
_glare_trail = part_system_create(prt_soul_trail);
part_system_global_space(_glare_trail, true);

_fade_timer = 7;
speed = 3;