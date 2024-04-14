/// @description Insert description here
// You can write your code in this editor

// Find target
target = instance_nearest(x, y, obj_base_enemy);

// Check distance to target
distance = distance_to_object(target);

attacking = (distance < max_range);

// Do attack
if(attacking && can_attack) {
	// Create fireball
	var _projectile = instance_create_depth(x, y, -1, projectile);
	_projectile._speed = 10;
	_projectile.target = target;
	
	// Predict enemy position
	var _prediction_x = target.x + target._speed * (distance / _projectile._speed);
	var _prediction_y = target.y + target._speed * (distance / _projectile._speed);
	
	_projectile.direction = point_direction(x, y, _prediction_x, _prediction_y);
	
	audio_play_sound(snd_summon_shoot, 0, false);
	
	// Reset attack
	can_attack = false;
	alarm_set(0, 60);
}