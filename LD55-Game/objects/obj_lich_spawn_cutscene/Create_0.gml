/// @description Insert description here
// You can write your code in this editor
obj_player._disabled = true;
obj_stats_controller._target_stats_offset = -960;
_cutscene_ended = false;

/* 
	0 = boss explosion spawn
	1 = boss prepares spell
	2 = boss casts shield and goes back to idle
	3 = end
*/
_step = 0;

_show_dialogue = false;
_dialogue_timer = 0.0125;
_dialogue_current = 0;
_dialogue_index = 1;
_dialogue_text = "";

_dialogue = [
	"Huh, well isn't this a curious predicament?",
	"I thought maybe a Reaper had found me, but all this headache is nothing but the work of a child playing with magic.",
	"You step into my domain, relying on familiars to fight your battles for you? Pathetic hehehe.",
	"The things you still have yet to learn... let me show you the power of ascension!"

];

_boss_name_underline = 1912;
_boss_name_opacity = 0;
_show_boss_name = false;

_particle_system = part_system_create(prt_boss_laser_glare);
_particle_system2 = pointer_null;
part_system_position(_particle_system, obj_test_boss.x, obj_test_boss.y);

_screen_width = 1920;
_screen_height = 1080;
_target_screen_width = _screen_width * 0.8;
_target_screen_height = _screen_height * 0.8;
_view_x = _screen_width / 2;
_view_y = _screen_height / 2;
_target_view_x = obj_test_boss.x;
_target_view_y = obj_test_boss.y;

_music_volume_start = global.music_volume;
_timer = 3;
_border_frame = 0;

view_camera[0] = camera_create();
var viewmat = matrix_build_lookat(_view_x, _view_y, -10, _view_x, _view_y, 0, 0, 1, 0);
var projmat = matrix_build_projection_ortho(_screen_width, _screen_height, 1.0, 32000.0);
camera_set_view_mat(view_camera[0], viewmat);
camera_set_proj_mat(view_camera[0], projmat);