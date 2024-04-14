/// @description Insert description here
// You can write your code in this editor

summon_command = ["UP", "UP", "DOWN", "DOWN", "DOWN"]


for(var _i = 0; _i < array_length(summon_command); _i++) {
	
	switch(summon_command[_i])
	{
		case "UP": 
			new_arrow = instance_create_depth(x, y, 0, obj_up_arrow);
			new_arrow.arrow_index = _i;
			new_arrow.parent_summon = self;
		break;
		
		case "DOWN": 
			new_arrow = instance_create_depth(x, y, 0, obj_down_arrow);
			new_arrow.arrow_index = _i;
			new_arrow.parent_summon = self;
		break;
		
		case "LEFT": 
			new_arrow = instance_create_depth(x, y, 0, obj_left_arrow);
			new_arrow.arrow_index = _i;
			new_arrow.parent_summon = self;
		break;
		
		case "RIGHT": 
			new_arrow = instance_create_depth(x, y, 0, obj_right_arrow);
			new_arrow.arrow_index = _i;
			new_arrow.parent_summon = self;
		break;
	}
}