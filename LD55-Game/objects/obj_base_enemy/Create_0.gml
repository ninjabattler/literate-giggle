/// @description Initializes the enemy
_can_be_stabbed = true;
_hp = _max_hp;
_heal_cooldown = false;

if(room == Level1) {
	init_enemy(_speed, pth_level_1);
}
else if(room == Level2) {
	init_enemy(_speed, pth_level_2);
}
else if(room == Level3) {
	init_enemy(_speed, pth_level_3);
}