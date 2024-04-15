/// @description Insert description here
// You can write your code in this editor
depth = 0;
image_xscale = -1;
image_speed = 0;

_momentum_x = 0;
_momentum_y = 0;
_initial_max_speed = 3;
_max_speed = 3;
_stab_cooldown = 15;
_stab_on_cooldown = false;
_disabled = false;

// Used for placing summons
_x_offset = 0;
_y_offset = 0;
_nearest_summon_dist = 0;
global._can_place = false;

// Setup for camera
camera_zoom_out = false;
camera_width = 1280;
camera_height = 720;
//camera_destroy(view_camera[0]);
//view_camera[0] = camera_create_view(0, 0, 1280, 720, 0, self, -1, -1, 640, 360);
