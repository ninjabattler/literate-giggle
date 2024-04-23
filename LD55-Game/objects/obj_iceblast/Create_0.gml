/// @description Insert description here
// You can write your code in this editor

event_inherited();
_damage = 0;
target = self;
_particle_system = part_system_create(prt_ice);
part_system_global_space(_particle_system, true);
direction = 0;