/// @description Insert description here
// You can write your code in this editor

x = obj_summon_window.x + 32
y = obj_summon_window.y + 64 + summon_index * 90

// Check if summon is affordable
if(obj_stats_controller._player_souls >= cost && !summon_arrows[0].can_afford) {
	for(var _i = 0; _i < array_length(summon_arrows); _i++) {
		summon_arrows[_i].can_afford = true;
	}
} else if(obj_stats_controller._player_souls < cost && summon_arrows[0].can_afford) {
	for(var _i = 0; _i < array_length(summon_arrows); _i++) {
		summon_arrows[_i].can_afford = false;
	}
}