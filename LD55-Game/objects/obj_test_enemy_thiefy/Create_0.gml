/// @description Insert description here
// You can write your code in this editor
event_inherited();

_thief_radius = instance_create_depth(x, y, 102, obj_thief_radius);
_thief_radius._enemy_to_folow = self;
_souls_stolen = 0;