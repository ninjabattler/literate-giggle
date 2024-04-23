/// @description Insert description here
// You can write your code in this editor

image_alpha -=0.05;
image_xscale -=0.03;
image_yscale -=0.03;
x += obj_player._momentum_x;
y += obj_player._momentum_y;

if (image_alpha <= 0) {
	instance_destroy(self);	
}