/// @description Insert description here
// You can write your code in this editor
event_inherited();
path_end();

depth = 0;
x = 540;
y = 540;

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

_shield_scale_offset = 0;
_target_shield_scale_offset = 0.2;

_targetable = false;
_targetable_timer = 0;
_fireball_reflects = 0;
_shield_rotate = 0;
_sprite_rotation = 0;

_fireball_timer = 2;
_rotation = 0;
_current_phase = 1;
radius = point_distance(960, 540, x, y);

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
_laser_spin_max_repeat = 120;

_laser_teleport_fan_timer = 0;
_laser_teleport_fan_repeat = 0;
_laser_teleport_fan_max_repeat = 5;
_laser_teleport_fan_teleports = 5;

_fireball_spin_timer = 0;
_fireball_spin_repeat = 0;
_fireball_spin_max_repeat = 120;

_fireball_burst_timer = 0;
_fireball_burst_timer = 0;
_fireball_burst_repeat = 0;
_fireball_burst_max_repeat = 5;

_fireball_teleport_timer = 0;
_fireball_teleport_repeat = 5;

_fireball_reflective_timer = 0;

_current_attack = 0;
_attack_orders = [
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_RING",
		"FIREBALL_BURST",
		"FIREBALL_REFLECTIVE"
	],
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_RING",
		"FIREBALL_BURST",
		"LASER_SPIN",
		"FIREBALL_TELEPORT",
		"FIREBALL_REFLECTIVE"
	],
	[
		"FIREBALL_RING",
		"LASER_TELEPORT",
		"LASER_FAN",
		"FIREBALL_RING",
		"FIREBALL_BURST",
		"LASER_SPIN",
		"LASER_TELEPORT_FAN",
		"FIREBALL_SPIN",
		"FIREBALL_TELEPORT",
		"FIREBALL_REFLECTIVE"
	],
]

audio_stop_sound(snd_music_main);
audio_play_sound(snd_music_boss, 0, true);

function apply_projectile_pose() {
	_arm_1_1_rotation = _arm_state_projectile[0]._arm_rot_1;
	_arm_1_2_rotation = _arm_state_projectile[0]._arm_rot_2;
	_arm_2_1_rotation = _arm_state_projectile[1]._arm_rot_1;
	_arm_2_2_rotation = _arm_state_projectile[1]._arm_rot_2;
	_arm_3_1_rotation = _arm_state_projectile[2]._arm_rot_1;
	_arm_3_2_rotation = _arm_state_projectile[2]._arm_rot_2;	
}