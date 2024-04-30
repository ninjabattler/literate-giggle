/// @description Rotates the enemy to face the way it's moving
rotate_enemy();

path_speed = _speed * global.game_speed;

if (_hp <= 0 && !_has_death_anim) {
	instance_destroy();	
}

// Stab Reset Timer
if (_stab_flag_timer > 0) {
	_stab_flag_timer -= global.game_speed * global.dt;
} else {
	_can_be_stabbed = true;
}

// Heal Cooldown Timer
if (_heal_cooldown_timer > 0) {
	_heal_cooldown_timer -= global.game_speed * global.dt;
} else {
	_heal_cooldown = false;
}

// Speed Reset Timer
if (_speed_reset_timer > 0) {
	_speed_reset_timer -= global.game_speed * global.dt;
} else if(_slowed) {
	_speed *= 4/3;
	_slowed = false;
}