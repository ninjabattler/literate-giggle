/// @description 
// You can write your code in this editor

// Gamepad input
if (global.gamepad_active) {
	if (gamepad_button_check_pressed(0, gp_face2)) {
		if(global.active_summon == 0) {
			target_x = 0;
			expanding = true;
		}	
	} else if (gamepad_button_check_released(0, gp_face2)) {
		target_x = -sprite_width
		expanding = false	
	}
}

// Expand the window
if(x < target_x && expanding) {
	x = lerp(x, target_x, 0.15);
}

if(x > target_x && expanding) {
	// Window fully expanded
	expanding = false
	expanded = true
	x = 0
} 
else if(x > target_x && !expanding) {
	// Window shrinking
	x = lerp(x, target_x, 0.1);	
} 
else if(x <= target_x && !expanding) {
	// Window fully out of view
	expanded = false
	x = -sprite_width
}

