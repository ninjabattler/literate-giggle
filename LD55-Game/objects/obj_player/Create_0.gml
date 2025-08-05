/// @description Insert description here
// You can write your code in this editor
depth = 0;
image_xscale = 1;
image_speed = 0;

_momentum_x = 0;
_momentum_y = 0;
_initial_max_speed = 5;
_max_speed = 5;
_accel = 0.9;
_friction = 0.85;

_stab_cooldown = 15;
_stab_on_cooldown = false;
_disabled = false;


// Used for placing summons
_x_offset = 0;
_y_offset = 0;
_nearest_summon_dist = 0;
global._can_place = true;

// Abilities
_has_dash = true;
_dash_count = 2;
_dash_max_count = 2;
_dash_speed_mult = 0;
_dash_dir = 0;

// Setup for camera
//camera_zoom_out = false;
//camera_width = 1280;
//camera_height = 720;
//camera_destroy(view_camera[0]);
//view_camera[0] = camera_create_view(0, 0, 1280, 720, 0, self, -1, -1, 640, 360);

//These following two values establish the default view scale as a reference point

view_enabled=true
view_visible[0]=true

//The camera's width and height.
view_wview = 1920;
view_hview = 1080; 
current_wview = 1920;
current_hview = 1080;

//The camera's position.
view_xview = 0;
view_yview = 0;
current_xview = 0;
current_yview = 0;

camera=camera_create_view(view_xview,view_yview,view_wview,view_yview)

view_set_camera(0,camera)

window_max_w = view_wview;
window_max_h = view_hview;
camera_min_w = view_wview / 2;
camera_min_h = view_hview / 2;

//Lower values means more speed
zoom_speed = 10;

window_set_size(view_wview,view_hview)
surface_resize(application_surface,view_wview,view_hview)
display_set_gui_size(view_wview,view_hview)

var display_width = display_get_width()
var display_height = display_get_height()

var window_width = view_wview
var window_height = view_hview

camera_set_view_pos(camera,view_xview,view_yview)
camera_set_view_size(camera,view_wview,view_hview)
camera_set_view_target(camera, obj_player);

// Spawn weapon
instance_create_depth(x, y, -1, obj_attack_arc);
