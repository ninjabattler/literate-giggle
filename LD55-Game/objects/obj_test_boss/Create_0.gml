/// @description Insert description here
// You can write your code in this editor
event_inherited();
path_end();

depth = 0;
radius = point_distance(960, 540, 540, 540);
x =  960 + radius * dcos(1.03)
y =  540 - radius * dsin(1.03)
_stats_offset = 960;
_target_stats_offset = 960;
_has_death_anim = true;
_invisible = true;
_shield_alpha = 0;
_hide_shield = true;
_particle_system = part_system_create(prt_boss_death_explosion_1);
_death_explosion_1 = part_emitter_create(_particle_system);
_death_explosion_timer = 1;
_death_explosion_arm = 2;
_death_explosion_arm_piece = 2;
part_system_global_space(_particle_system, true);

_active = false;
_defeated = false;

_arm_state = "IDLE";
_arm_state_idle = [
	{
		_arm_rot_1: 60,
		_arm_rot_2: 40
	},
	{
		_arm_rot_1: -60,
		_arm_rot_2: 0
	},
	{
		_arm_rot_1: 180,
		_arm_rot_2: -90
	}
]
_arm_state_spin = [
	{
		_arm_rot_1: 0,
		_arm_rot_2: 60
	},
	{
		_arm_rot_1: 120,
		_arm_rot_2: -60
	},
	{
		_arm_rot_1: 240,
		_arm_rot_2: -180
	},
]
_arm_state_teleport = [
	{
		_arm_rot_1: 60,
		_arm_rot_2: 120
	},
	{
		_arm_rot_1: -60,
		_arm_rot_2: -120
	},
	{
		_arm_rot_1: 240,
		_arm_rot_2: -90
	},
]
_arm_state_projectile = [
	{
		_arm_rot_1: 90,
		_arm_rot_2: -150
	},
	{
		_arm_rot_1: -90,
		_arm_rot_2: 150
	},
	{
		_arm_rot_1: 180,
		_arm_rot_2: -240
	},
]
_arm_state_defense_1 = [
	{
		_arm_rot_1: 60,
		_arm_rot_2: 70
	},
	{
		_arm_rot_1: -120,
		_arm_rot_2: -180
	},
	{
		_arm_rot_1: 120,
		_arm_rot_2: -180
	},
]
_arm_state_defense_2 = [
	{
		_arm_rot_1: 40,
		_arm_rot_2: 70
	},
	{
		_arm_rot_1: -40,
		_arm_rot_2: -70
	},
	{
		_arm_rot_1: 140,
		_arm_rot_2: -240
	},
]
_arm_state_defense_3 = [
	{
		_arm_rot_1: 80,
		_arm_rot_2: 10
	},
	{
		_arm_rot_1: -80,
		_arm_rot_2: -20
	},
	{
		_arm_rot_1: 40,
		_arm_rot_2: 40
	},
]
_arm_state_single_laser = [
	{
		_arm_rot_1: 0,
		_arm_rot_2: 0
	},
	{
		_arm_rot_1: -120,
		_arm_rot_2: -150
	},
	{
		_arm_rot_1: 120,
		_arm_rot_2: -210
	},
]
_arm_state_double_laser = [
	{
		_arm_rot_1: -60,
		_arm_rot_2: 60
	},
	{
		_arm_rot_1:	60,
		_arm_rot_2: -60
	},
	{
		_arm_rot_1: 225,
		_arm_rot_2: -125
	},
]
_arm_state_stretched = [
	{
		_arm_rot_1: 0,
		_arm_rot_2: 0
	},
	{
		_arm_rot_1: 120,
		_arm_rot_2: -120
	},
	{
		_arm_rot_1: 240,
		_arm_rot_2: 120
	},
]

_arm_position_offsets = [
	[
		0,
		0,
		0
	],
	[
		0,
		0,
		0
	],
	[
		0,
		0,
		0
	]
]

_arm_position_target_offsets = [
	[
		0,
		0,
		0
	],
	[
		0,
		0,
		0
	],
	[
		0,
		0,
		0
	]
]

_arm_piece_destroyed = [
	[
		false,
		false,
		false
	],
	[
		false,
		false,
		false
	],
	[
		false,
		false,
		false
	]
]

_arm_1_1_rotation = 0;
_arm_1_2_rotation = 0;
_arm_1_1_rotation_offset = 0;
_target_arm_1_1_rotation_offset = 10;
_arm_1_2_rotation_offset = 0;
_target_arm_1_2_rotation_offset = 10;

_arm_2_1_rotation = 0;
_arm_2_2_rotation = 0;
_arm_2_1_rotation_offset = 0;
_target_arm_2_1_rotation_offset = 10
_arm_2_2_rotation_offset = 0;
_target_arm_2_2_rotation_offset = 10;

_arm_3_1_rotation = 0;
_arm_3_2_rotation = 0;
_arm_3_1_rotation_offset = 0;
_target_arm_3_1_rotation_offset = 10;
_arm_3_2_rotation_offset = 0;
_target_arm_3_2_rotation_offset = 10;

_arm_rotation_timer = 0.75;

_arm_rotation_timer_1_1 = 0.75;
_arm_rotation_timer_1_2 = 0.8;
_arm_rotation_timer_2_1 = 0.65;
_arm_rotation_timer_2_2 = 0.7;
_arm_rotation_timer_3_1 = 0.85;
_arm_rotation_timer_3_2 = 0.9;

_shield_scale_offset = 0;
_target_shield_scale_offset = 0.2;
_shield_index = 0;

_targetable = false;
_targetable_timer = 0;
_fireball_reflects = 0;
_shield_rotate = 0;
_sprite_rotation = 0;

_fireball_timer = 2;
_rotation = 0;
_current_phase = 1;

_attacking = false;
_fireball_ring = false;
_laser_teleport = false;
_laser_fan = false;
_laser_spin = false;
_laser_teleport_fan = false;
_fireball_spin = false;
_fireball_burst = false;
_fireball_reflective = false;
_fireball_teleport = false;
_single_laser = false;
_double_laser = false;
_triple_laser = false;
_blue_lasers = [];
_attack_name = "";

_attack_timer = 3;

_fireball_timer = 0;
_fireball_ring_timer = 0;
_fireball_ring_repeat = 0;
_fireball_ring_max_repeat = 1;

_laser_teleport_timer = 0;
_laser_teleport_repeat = 5;

_laser_fan_timer = 0;
_laser_fan_angle = 0;
_laser_fan_repeat = 0;
_laser_fan_max_repeat = 5;

_laser_spin_timer = 0;
_laser_spin_repeat = 0;
_laser_spin_max_repeat = 30;

_laser_teleport_fan_timer = 0;
_laser_teleport_fan_repeat = 0;
_laser_teleport_fan_max_repeat = 5;
_laser_teleport_fan_teleports = 5;

_fireball_spin_timer = 0;
_fireball_spin_repeat = 0;
_fireball_spin_max_repeat = 30;

_fireball_burst_timer = 0;
_fireball_burst_timer = 0;
_fireball_burst_repeat = 0;
_fireball_burst_max_repeat = 5;

_fireball_teleport_timer = 0;
_fireball_teleport_repeat = 5;

_single_laser_timer = 4;
_single_laser_repeat = 5;
_single_laser_homing_timer = 0.025;
_single_laser_homing_repeat = 0;

_double_laser_start_timer = 2.5;
_double_laser_timer = 15;
_double_laser_projectile_timer = 0.5;
_double_laser_projectile_offset = 1;

_triple_laser_projectile_timer = 2.5;
_triple_laser_projectile_repeat = 500;
_triple_laser_warning_timer = 2;

_fireball_reflective_timer = 0;

_current_attack = 0;
_attack_orders = [
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_RING",
		"FIREBALL_BURST",
		"SINGLE_LASER"
	],
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_BURST",
		"LASER_SPIN",
		"FIREBALL_TELEPORT",
		"DOUBLE_LASER"
	],
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_BURST",
		"LASER_SPIN",
		"LASER_TELEPORT_FAN",
		"FIREBALL_SPIN",
		"FIREBALL_TELEPORT",
		"TRIPLE_LASER",
	],
]

function apply_projectile_pose() {
	_arm_1_1_rotation = _arm_state_projectile[0]._arm_rot_1;
	_arm_1_2_rotation = _arm_state_projectile[0]._arm_rot_2;
	_arm_2_1_rotation = _arm_state_projectile[1]._arm_rot_1;
	_arm_2_2_rotation = _arm_state_projectile[1]._arm_rot_2;
	_arm_3_1_rotation = _arm_state_projectile[2]._arm_rot_1;
	_arm_3_2_rotation = _arm_state_projectile[2]._arm_rot_2;	
}

function reset_arm_offsets() {
	for (var _i = 0; _i < array_length(_arm_position_target_offsets); _i++) {
		for (var _j = 0; _j < array_length(_arm_position_target_offsets[_i]); _j++) {
			_arm_position_target_offsets[_i][_j] = 0;
		}
	}	
}