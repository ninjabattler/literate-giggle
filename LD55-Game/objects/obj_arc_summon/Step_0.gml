/// @description Insert description here
// You can write your code in this editor

crystal_rotation++;

// Find arc target
//target = instance_nearest(x, y, obj_summon_base);
target = instance_nth_nearest(x, y, obj_summon_base, 2);

// Check distance to target
distance = distance_to_object(target);

attacking = (distance < max_range);