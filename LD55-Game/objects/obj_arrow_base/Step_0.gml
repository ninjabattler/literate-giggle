/// @description Insert description here
// You can write your code in this editor

if(is_hovered) {
	_mysine = (_mysine+2) mod 360;
	image_xscale = 1 + (sin(degtorad(_mysine))/3);
	image_yscale = image_xscale;
} else {
	if(image_xscale < target_scale && abs(image_xscale - target_scale) > 0.1) {
		image_xscale+=0.05
		image_yscale+=0.05
	} else if(image_xscale > target_scale && abs(image_xscale - target_scale) > 0.1) {
		image_xscale-=0.05
		image_yscale-=0.05
	}
}

if(pressed && global.active_arrow == 0 && !global.summon_window_active) {
	image_blend = #aaaaaa;
}
