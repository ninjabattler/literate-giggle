/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (_fireball_timer > 0) {
    _fireball_timer -= global.game_speed * global.dt;
} else {
    instance_create_depth(x, y, 0, obj_boss_fireball);
    _fireball_timer = 2;
}