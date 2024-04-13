// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function init_enemy(speed);
/// @param {real}  speed  The speed to follow at

function init_enemy(speed = 1){
	path_start(pth_test_path, speed, path_action_continue, false);
	image_angle = direction;
}

/// @function rotate_enemy();
function rotate_enemy() {
	image_angle = direction;	
}