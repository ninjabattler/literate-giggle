/// @description Insert description here
// You can write your code in this editor

summon_command = ["UP", "UP", "DOWN", "DOWN", "DOWN"];
summon_arrows = [];
summon_progress = 0;


for(var _i = 0; _i < array_length(summon_command); _i++) {
	
	switch(summon_command[_i])
	{
		case "UP": 
			var _new_arrow = instance_create_depth(x, y, -2, obj_up_arrow)
			array_push(summon_arrows, _new_arrow);
			_new_arrow.arrow_index = _i;
			_new_arrow.parent_summon = self;
		break;
		
		case "DOWN": 
			var _new_arrow1 = instance_create_depth(x, y, -2, obj_down_arrow)
			array_push(summon_arrows, _new_arrow1);
			_new_arrow1.arrow_index = _i;
			_new_arrow1.parent_summon = self;
		break;
		
		case "LEFT": 
			var _new_arrow2 = instance_create_depth(x, y, -2, obj_left_arrow)
			array_push(summon_arrows, _new_arrow2);
			_new_arrow2.arrow_index = _i;
			_new_arrow2.parent_summon = self;
		break;
		
		case "RIGHT": 
			var _new_arrow3 = instance_create_depth(x, y, -2, obj_right_arrow)
			array_push(summon_arrows, _new_arrow3);
			_new_arrow3.arrow_index = _i;
			_new_arrow3.parent_summon = self;
		break;
	}
}