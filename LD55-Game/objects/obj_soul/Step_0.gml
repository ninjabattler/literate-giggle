/// @description Insert description here
// You can write your code in this editor
if (_follow) {
	move_towards_point(_enemy_to_follow.x, _enemy_to_follow.y, 1);
}

if (distance_to_object(obj_player) < 60 && !_follow) {
	_follow_player = true;	
}

if (_follow_player) {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	speed += 0.1;
}

if (speed > 0 && !_follow && !_follow_player) {
	speed -= _deceleration;
	direction = _random_direction;
	image_angle = _random_direction;
} else if (speed < 0) {
	speed = 0;	
}