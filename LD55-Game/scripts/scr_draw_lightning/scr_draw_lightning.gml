function draw_lightning(_x1, _y1, _x2, _y2, _branches, _color, _seed)
{
    ///draw_lightning(x, y, _x2, _y2, branches, colour)
    //
    //draws a lightning bolt from the given starting location to the given end location
    //
    //x = x of the bolt's start
    //y = y of the bolt's start
    //_x2 = x of the bolt's end
    //_y2 = y of the bolt's end
    //branches = true or false, if the lightning bolt branches into multiple smaller ones
    //colour = colour of the glow
    //
    //amusudan 23/5/2016
    //
    //feel free to use this in your project!
    //
	random_set_seed(_seed);
	
	// Strange coord adjustment?
	_x1 = _x1 - 1;
	_y1 = _y1 - 1;
	
    var _dir = point_direction(_x1,_y1,_x2,_y2);
    var _length = point_distance(_x1,_y1,_x2,_y2);
    var _colour = _color;

    //make different segments
    var _i = 0;
    var _i2 = 1;
    var _point;
    _point[0] = 0;
    do
        {
        _i++;
        if random(1) < .06
            {
            _point[_i2] = _i;
            _i2++;
            }
        }
    until _i >= _length
    _point[_i2] = _length;
    var _points = array_length_1d(_point);

    //draw segments
    _i = 0;
    _i2 = 1
    var _difx = 0;
    var _dif_x2 = 0;
    var _dify = 0;
    var _dif_y2 = 0;

    do //loop through and draw all the segments
        {
        _difx = random_range(-7,7)
        _dify = random_range(-7,7)
    
        var _xx = _x1 + lengthdir_x(_point[_i2 - 1],_dir);
        var _yy = _y1 + lengthdir_y(_point[_i2 - 1],_dir);
        var _x_x2 = _x1 + lengthdir_x(_point[_i2],_dir);
        var _y_y2 = _y1 + lengthdir_y(_point[_i2],_dir);
    
        //create a branch
        if random(1) < .15 && _branches
            {
            var _bdir = _dir + choose(random_range(-45,-25),random_range(45,25));
            var _blength = random_range(5,30);
            draw_lightning(_xx + _dif_x2, _yy + _dif_y2, _xx + _dif_x2 + lengthdir_x(_blength,_bdir), _yy + _dif_y2 + lengthdir_y(_blength,_bdir), false,_colour, _seed)
            }
    
        var _size = random_range(.1,1);
        //draw the glow of the lightning
        draw_set_alpha(.1)
        draw_line_width_colour(_xx + _dif_x2,_yy + _dif_y2,_x_x2 + _difx,_y_y2 + _dify, _size + 7,_colour,_colour);
        draw_line_width_colour(_xx + _dif_x2,_yy + _dif_y2,_x_x2 + _difx,_y_y2 + _dify, _size + 5,c_white,c_white);
        draw_line_width_colour(_xx + _dif_x2,_yy + _dif_y2,_x_x2 + _difx,_y_y2 + _dify, _size + 3,c_white,c_white);
        draw_set_alpha(1)
        //draw the white center of the _dif_x2
        draw_line_width_colour(_xx + _dif_x2,_yy + _dif_y2,_x_x2 + _difx,_y_y2 + _dify, _size+1,c_white,c_white);
    
        _i2++;
        _dif_x2 = _difx;
        _dif_y2 = _dify;
        }
    until _i2 = _points

    //draw a glowing circle
    if _branches
        {
        var _size = random_range(2,2)
        draw_set_alpha(.1)
        draw_circle_colour(_x1,_y1,_size + 4,_colour,_colour,false);
        draw_circle_colour(_x1,_y1,_size + 2,_colour,_colour,false);
        draw_circle_colour(_x1,_y1,_size + 1,_colour,_colour,false);
        draw_set_alpha(1)
        draw_circle_colour(_x1,_y1,_size,c_white,c_white,false);
        }
}