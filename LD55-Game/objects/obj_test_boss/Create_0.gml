/// @description Insert description here
// You can write your code in this editor
event_inherited();
path_end();

x = 540
y = 540

_targetable = false;
_targetable_timer = 0;
_fireball_reflects = 0;
_shield_rotate = 0;

_fireball_timer = 2;
_rotation = 0;
_current_phase = 1;
radius = point_distance(960, 540, x, y);

_attacking = false;
_fireball_ring = false;
_laser_teleport = false;
_laser_fan = false;
_fireball_burst = false;
_fireball_reflective = false;

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

_fireball_burst_timer = 0;
_fireball_burst_timer = 0;
_fireball_burst_repeat = 0;
_fireball_burst_max_repeat = 5;

_fireball_reflective_timer = 0;

_current_attack = 0;
_attack_order = [
	"FIREBALL_RING",
	"LASER_TELEPORT",
	"LASER_FAN",
	"FIREBALL_RING",
	"FIREBALL_BURST",
	"FIREBALL_REFLECTIVE"
]

audio_stop_sound(snd_music_main);
audio_play_sound(snd_music_boss, 0, true);