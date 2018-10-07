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

var sw = sprite_get_width(ico_block);
var sh = sprite_get_height(ico_block)/2;

draw_rectPrism_ext(x,y,z,sw,sw,sh,ico_block,0,0,0,true,false,drawNorth,drawWest,drawSouth,drawEast);

if point_in_triangle(obj_player.x,obj_player.y,x+32,y+32,x - 1000, y - 1000, x - 1000, y + 1000)
{
	if power_on or obj_player.computer_boot
		image = 0;
	else image = 4;
}
else if point_in_triangle(obj_player.x,obj_player.y,x+32,y+32,x+1000,y-1000,x+1000,y+1000)
	image = 2;
else if point_in_triangle(obj_player.x,obj_player.y,x+32,y+32,x+1000,y-1000,x-1000,y-1000)
	image = 1;
else image = 3;

draw_plane(x+32,y+32,z+32,24,48,0,0,spr_monitor,image,true);
/*
var vb = global.vb_blocks;
var vf = global.vf;
var tex = sprite_get_texture(spr_monitor,image);
var xx = x + 32;
var yy = y + 32;
var zz = z + 32;
var ww = 24;
var wx = lengthdir_x(ww,obj_player.dir+90);
var wy = lengthdir_y(ww,obj_player.dir+90);
var hh = 48;

vertex_begin(vb,vf);

vertex_position_3d(vb,xx-wx,yy-wy,zz); //bottom left
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,0,1);
	vertex_color(vb,c_white,1);
vertex_position_3d(vb,xx+wx,yy+wy,zz); //bottom right
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,1,1);
	vertex_color(vb,c_white,1);
vertex_position_3d(vb,xx+wx,yy+wy,zz+hh); //top right
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,1,0);
	vertex_color(vb,c_white,1);
	
vertex_position_3d(vb,xx+wx,yy+wy,zz+hh); //top right
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,1,0);
	vertex_color(vb,c_white,1);
vertex_position_3d(vb,xx-wx,yy-wy,zz+hh); //top left
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,0,0);
	vertex_color(vb,c_white,1);
vertex_position_3d(vb,xx-wx,yy-wy,zz); //bottom left
	vertex_normal(vb,0,0,0);
	vertex_texcoord(vb,0,1);
	vertex_color(vb,c_white,1);

vertex_end(vb);
vertex_submit(vb,pr_trianglelist,tex);