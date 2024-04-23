/// @description Insert description here
// You can write your code in this editor

crystal_rotation++;

// Find target
target = instance_nearest(x, y, obj_base_enemy);

// Check distance to target
distance = distance_to_object(target);

attacking = (distance < max_range);

if (instance_number(obj_test_boss) > 0) {
	attacking = true;
	target = obj_test_boss;
}

if (x < 0 || y < 0) {
	attacking = false;	
}