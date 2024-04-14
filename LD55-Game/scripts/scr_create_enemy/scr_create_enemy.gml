// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function init_enemy(_enemy);
/// @param {Asset.GMObject}  _enemy The enemy to spawn
function scr_create_enemy(_enemy) {
	var _offset_x = random_range(-8, 8);
	var _offset_y = random_range(-8, 8);
	instance_create_depth(global.spawn_x + _offset_x, global.spawn_y + _offset_y, 102, _enemy);
}