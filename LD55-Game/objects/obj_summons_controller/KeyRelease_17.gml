/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_summon_placer) && global.active_summon == 0) {
	instance_destroy(obj_summon_placer);
}

global.active_arrow = 0;
global.summon_window_active = false;