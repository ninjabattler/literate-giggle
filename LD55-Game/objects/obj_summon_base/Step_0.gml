/// @description Insert description here
// You can write your code in this editor

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
	can_attack = false;	
}

// Do attack
if(attacking && can_attack && target._targetable) {
	// Create fireball
	var _projectile = instance_create_depth(x, y, -1, projectile);
	_projectile._speed = projectile_speed;
	_projectile.target = target;
	_projectile._damage = damage;
	
	// Predict enemy position
	var _prediction_x = target.x + target._speed * (distance / _projectile._speed);
	var _prediction_y = target.y + target._speed * (distance / _projectile._speed);
	
	_projectile.direction = point_direction(x, y, _prediction_x, _prediction_y);
	
	audio_play_sound(snd_summon_shoot, 0, false);
	
	// Reset attack
	can_attack = false;
	_attack_timer = 1
}

// Attack Timer
if (_attack_timer > 0) {
	_attack_timer -= global.game_speed * global.dt;
} else if (!can_attack) {
	can_attack = true;
}