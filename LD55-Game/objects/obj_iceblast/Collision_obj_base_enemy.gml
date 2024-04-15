/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_enemy_hurt, 0, false);
other._hp -= _damage;

// Apply slowing to enemy if able
if(!other._slowed) {
	other._speed *= 0.75;
	other.path_speed = other._speed;
	other._slowed = true;
}

instance_destroy(self);