var xx = obj_player.x;
var yy = obj_player.y;
var dir = obj_player.dir;

var culltr1 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir+90),yy+lengthdir_y(1028,dir+90));
var culltr2 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir-90),yy+lengthdir_y(1028,dir-90));

if !culltr1 and !culltr2
	{exit;}

if obj_player.x < x
{
	draw_plane(x+4/*24*/,y,z,32,64,90,0,spr_wiretrap,1,false);
	draw_plane(x   ,y,z,32,64,90,0,spr_wiretrap,0,false);
	//draw_plane(x-24,y,z,64,64,90,0,spr_wiretrap,2,false);
}
else
{
	draw_plane(x-4/*24*/,y,z,32,64,-90,0,spr_wiretrap,1,false);
	draw_plane(x   ,y,z,32,64,-90,0,spr_wiretrap,0,false);
	//draw_plane(x+24,y,z,64,64,-90,0,spr_wiretrap,2,false);
}

//draw_sprite_ext(sprite_index,0,x,y,1,1,90,c_black,0.6);