/// @description Insert description here
// You can write your code in this editor
event_inherited();

_slow_radius = instance_create_depth(x, y, 102, obj_slow_radius);
_slow_radius._enemy_to_follow = self;

image_xscale = 1.5;
image_yscale = 1.5;