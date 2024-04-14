/// @description Insert description here
// You can write your code in this editor


// Calculates distance to obstacles center
var _obs_dist = point_distance(x, y, other.x, other.y);
// Calculates direction to obstacle
var _obs_dir = point_direction(other.x, other.y, x, y);
	
// Sets buffer from sprite dimentions
var _x_buff = other.sprite_width * 0.75;
var _y_buff = other.sprite_height * 0.75;
	
// Calculates the repulse speed from the distance and direction
var _repulse_x = lengthdir_x(clamp(1 - _obs_dist / _x_buff, 0, 1), _obs_dir) * _x_buff * 1.5;
var	_repulse_y = lengthdir_y(clamp(1 - _obs_dist / _y_buff, 0, 1), _obs_dir) * _y_buff * 1.5;
	
// Adds the new speed to the existing speed
_momentum_x += _repulse_x;
_momentum_y += _repulse_y;
	
// Clamps the speed to maximum speed
_momentum_x = clamp(_momentum_x, -_max_speed, _max_speed);
_momentum_y = clamp(_momentum_y, -_max_speed, _max_speed);
