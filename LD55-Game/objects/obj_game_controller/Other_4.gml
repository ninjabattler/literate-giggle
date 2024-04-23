/// @description Insert description here
// You can write your code in this editor

// Set starting souls
switch(room) {
	case TitleRoom:
		obj_start_button._button_id = 0;
		obj_exit_button._button_id = 1;
	break;
	case Level1:
		obj_stats_controller._player_souls = 10;
	break;
	
	case Level2:
		obj_stats_controller._player_souls = 10;
	break;
	
	case Level3:
		obj_stats_controller._player_souls = 15;
	break;
	
	case Level4:
		obj_stats_controller._player_souls = 15;
	break;
	
	case Level5:
		obj_stats_controller._player_souls = 30;
	break;
}