/// @description Insert description here

//frustrum cull
var xx = obj_player.x;
var yy = obj_player.y;
var dir = obj_player.dir;

var culltr1 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir+90),yy+lengthdir_y(1028,dir+90));
var culltr2 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir-90),yy+lengthdir_y(1028,dir-90));

if !culltr1 and !culltr2
	{exit;}

var drawNorth,drawEast,drawSouth,drawWest;

drawNorth = !place_meeting(x,y-1,obj_server);
drawWest = !place_meeting(x+1,y,obj_server);
drawSouth = !place_meeting(x,y+1,obj_server);
drawEast = !place_meeting(x-1,y,obj_server);

var sw = sprite_get_width(spr_server);
var sh = sprite_get_height(spr_server);

draw_rectPrism_ext(x,y,z,sw,sw,sh,spr_server,0,0,0,false,false,drawNorth,drawWest,drawSouth,drawEast);