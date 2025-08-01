/// @description Insert description here
// You can write your code in this editor
obj_player._disabled = true;
obj_stats_controller._target_stats_offset = -960;
_cutscene_ended = false;

_screen_width = 1920;
_screen_height = 1080;
_target_screen_width = _screen_width * 0.8;
_target_screen_height = _screen_height * 0.8;
_view_x = _screen_width / 2;
_view_y = _screen_height / 2;
_target_view_x = obj_test_boss.x;
_target_view_y = obj_test_boss.y;

_music_volume_start = global.music_volume;
_timer = 5;
_border_frame = 0;

view_camera[0] = camera_create();
var viewmat = matrix_build_lookat(_view_x, _view_y, -10, _view_x, _view_y, 0, 0, 1, 0);
var projmat = matrix_build_projection_ortho(_screen_width, _screen_height, 1.0, 32000.0);
camera_set_view_mat(view_camera[0], viewmat);
camera_set_proj_mat(view_camera[0], projmat);