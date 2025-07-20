/// @description Insert description here
// You can write your code in this editor
_colour_tint = #ffffff

depth = 0;
//ran_num = random(1);

//if(ran_num < 0.5) {
//	image_xscale = -1;	
//	x+=64;
//}

//x += random_range(-4, 4);
//y += random_range(-4, 4);

ran_num = random(1);
if (ran_num <= 0.25) {
	_colour_tint = #ff99aa;
} else if (ran_num <= 0.5) {
	_colour_tint = c_fuchsia;
} else if (ran_num <= 0.75) {
	_colour_tint = #ff5566;
}
