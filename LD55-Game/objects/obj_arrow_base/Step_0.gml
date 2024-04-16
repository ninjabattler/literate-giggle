/// @description Insert description here
// You can write your code in this editor


// Show as can't afford
if(!can_afford) {
	image_blend = #662222;
} else {
	image_blend = #aaaaaa;
	// Show as disabled
	if(pressed) {
		image_blend = c_white;
	}
	if(disabled) {
		image_blend = #555555;
	}

}


// Press if at correct index
if(keyboard_check_pressed(ord(key)) && global.active_arrow == arrow_index && !disabled && can_afford) {
	image_xscale = max_scale;
	image_yscale = max_scale;

	pressed = true;
}

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

// Reset to neutral state
if(pressed && global.active_arrow == 0 && !global.summon_window_active) {
	image_blend = #aaaaaa;
}

// Reset to neutral from disabled state
if(disabled && global.active_arrow == 0 && !global.summon_window_active) {
	image_blend = #aaaaaa;
	disabled = false;
}




