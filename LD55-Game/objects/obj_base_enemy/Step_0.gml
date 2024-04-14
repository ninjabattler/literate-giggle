/// @description Rotates the enemy to face the way it's moving
rotate_enemy();

if (_hp <= 0) {
	instance_destroy();	
}