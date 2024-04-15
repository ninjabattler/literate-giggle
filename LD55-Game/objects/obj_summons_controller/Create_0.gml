/// @description Insert description here
// You can write your code in this editor

global.active_arrow = 0;
global.summon_window_active = false;
global.active_summon = 0;

// Display list of available summons
for(var _i = 0; _i < array_length(global.summons_list); _i++) {
	summon = instance_create_depth(0, 0, -1, global.summons_list[_i]);
	summon.summon_index = _i;
}