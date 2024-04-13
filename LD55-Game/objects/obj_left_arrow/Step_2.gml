/// @description Insert description here
// You can write your code in this editor

x = window_panel.x + 32 + 16

if(is_hovered) {
	_mysine = (_mysine+2) mod 360;
	image_xscale = 2 + (sin(degtorad(_mysine))/3);
	image_yscale = image_xscale;
} else {
	if(image_xscale < target_scale && abs(image_xscale - target_scale) > 0.1) {
		image_xscale+=0.1
		image_yscale+=0.1
	} else if(image_xscale > target_scale && abs(image_xscale - target_scale) > 0.1) {
		image_xscale-=0.1
		image_yscale-=0.1
	}
}
