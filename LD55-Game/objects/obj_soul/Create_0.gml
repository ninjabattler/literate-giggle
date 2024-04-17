/// @description Insert description here
// You can write your code in this editor
_enemy_to_follow = obj_test_enemy_thiefy;
_follow = false;
_random_direction = random_range(0, 360);
_deceleration = random_range(0.075, 0.15);
_follow_player = false;
_fading_out = false;

alarm_set(0, 420)
speed = 3;