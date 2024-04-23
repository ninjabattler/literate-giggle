/// @description Insert description here
// You can write your code in this editor
if (!global.gamepad_active) {
	instance_create_depth(x, y, 0, obj_summon_placer);

	if(global.active_summon == 0) {
		global.summon_window_active = true;
	}
}