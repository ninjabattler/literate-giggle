/// @description Insert description here
// You can write your code in this editor

depth = 1;
_colour_tint = #ffffff;

ran_num = random(1);
if(ran_num < 0.5) {
	image_xscale = -1;	
	x+=sprite_width;
}

ran_num = random(1);
if (ran_num <= 0.25) {
	_colour_tint = #ff99aa;
} else if (ran_num <= 0.5) {
	_colour_tint = c_fuchsia;
} else if (ran_num <= 0.75) {
	_colour_tint = #ff5566;
}


x += random_range(-4, 4);
y += random_range(-4, 4);

