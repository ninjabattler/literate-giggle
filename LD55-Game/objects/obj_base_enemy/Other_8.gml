/// @description Destroys the enemy when it reaches the end of the path
obj_stats_controller._player_health -= _damage;
instance_destroy(self, false);