var xx = obj_player.x;
var yy = obj_player.y;
var dir = obj_player.dir;

var culltr1 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir+90),yy+lengthdir_y(1028,dir+90));
var culltr2 = point_in_triangle(x,y,xx,yy,xx+lengthdir_x(1028,dir),yy+lengthdir_y(1028,dir),xx+lengthdir_x(1028,dir-90),yy+lengthdir_y(1028,dir-90));

if !culltr1 and !culltr2
	{exit;}
	
var rotfactor = 0;
if rot = 180 {rotfactor = 1;}
rot -= 90;
	
if obj_player.x < x
{
	draw_plane(x+24,y+64*rotfactor,z,64,128,rot,0,spr_spilledWires,0,false);
	draw_plane(x,y+64*rotfactor,z,64,128,rot,0,spr_spilledWires,1,false);
	draw_plane(x-24,y+64*rotfactor,z,64,128,rot,0,spr_spilledWires,2,false);
}
else
{
	draw_plane(x-24,y+64*rotfactor,z,64,128,-rot,0,spr_spilledWires,0,false);
	draw_plane(x,y+64*rotfactor,z,64,128,-rot,0,spr_spilledWires,1,false);
	draw_plane(x+24,y+64*rotfactor,z,64,128,-rot,0,spr_spilledWires,2,false);
}

rot += 90;
//draw_rectangle(x,y,x+64,y+64,false);