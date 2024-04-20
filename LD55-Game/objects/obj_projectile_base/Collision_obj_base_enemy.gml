/// @description Insert description here

// Do sound stuff
var _sound_pitch = random_range(0.8, 1.2);

var _sound_params =
{
    sound: snd_enemy_hurt,
    priority: 1,
    gain: 0.75,
    pitch: _sound_pitch,
};

audio_play_sound_ext(_sound_params);

other._hp -= _damage;
instance_destroy(self);