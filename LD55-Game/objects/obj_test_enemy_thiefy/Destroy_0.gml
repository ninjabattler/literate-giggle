/// @description Insert description here
// You can write your code in this editor
instance_destroy(_thief_radius);
for(var _i = 0; _i < _souls_stolen; _i++) {
	instance_create_depth(x, y, 0, obj_soul);	
}

event_inherited();