/// @description Insert description here
// You can write your code in this editor

global.game_paused = false;
instance_activate_all();
surface_free(global.paused_surf);
global.paused_surf = -1;
