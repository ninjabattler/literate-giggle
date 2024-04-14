/// @description Insert description here
// You can write your code in this editor

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