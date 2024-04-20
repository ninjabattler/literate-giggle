/// @description Insert description here
// You can write your code in this editor

_side = "LEFT";
_can_switch = true;
_target_dir_offset = -30;
_current_dir_offset = -30;

_part_sys = part_system_create(prt_swing);
_part_em = part_emitter_create(_part_sys);
//_part_em.
part_system_global_space(_part_sys, true);