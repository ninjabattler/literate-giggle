if (_show_dialogue) {
	if (string_length(_dialogue_text) < string_length(_dialogue[_dialogue_current])) {
		_dialogue_text = _dialogue[_dialogue_current];
	} else if (_dialogue_current == 2) {
		_dialogue_current += 1;
		_dialogue_timer = 0.0125;
		_dialogue_index = 1;
		_dialogue_text = "";
		_show_dialogue = false;
		_step += 1;
	} else if (_dialogue_current != array_length(_dialogue) - 1) {
		_dialogue_current += 1;
		_dialogue_timer = 0.0125;
		_dialogue_index = 1;
		_dialogue_text = "";
	} else {
		_show_dialogue = false;
		_step += 1;
	}
}