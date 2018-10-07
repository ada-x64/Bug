///@draw_rectPrism(x,y,z,length,width,height,sprite,x-rot,y-rot,z-rot,drawTop,drawBottom,drawNorth,drawWest,drawEast,drawSouth)
///@param x
///@param y
///@param z
///@param length
///@param width
///@param height
///@param sprite
///@param x-rot
///@param y-rot
///@param z-rot
///@param drawTop
///@param drawBottom
///@param drawNorth
///@param drawWest
///@param drawSouth
///@param drawEast

var xx			= argument0;
var yy			= argument1;
var zz			= argument2;
var L			= argument3;
var W			= argument4;
var H			= argument5;
var spr			= argument6;
var rot_x		= cos(argument7);
var rot_y		= cos(argument8);
var rot_z		= sin(argument9);
var drawTop		= argument10;
var drawBottom	= argument11;
var drawNorth	= argument12;
var drawWest	= argument13;
var drawSouth	= argument14;
var drawEast	= argument15;

//xx = xx + L*rot_x;
//yy = yy + W*rot_y;
//zz = zz + H*rot_z;

var vb = global.vb_blocks;
gpu_set_cullmode(cull_clockwise);
#region north
if drawNorth
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,-1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
	vertex_position_3d(vb,xx+L,yy,zz);		//bottom right
		vertex_normal(vb,1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx+L,yy,zz+H);		//top right
		vertex_normal(vb,1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
	vertex_position_3d(vb,xx+L,yy,zz+H);		//top right
		vertex_normal(vb,1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
	vertex_position_3d(vb,xx,yy,zz+H);		//top left
		vertex_normal(vb,-1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,-1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,0));
}
#endregion north
#region west
if drawWest
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx+L,yy,zz);			//bottom left
		vertex_normal(vb,-1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
	vertex_position_3d(vb,xx+L,yy+W,zz);		//bottom right
		vertex_normal(vb,-1,-1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,-1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
		
	vertex_position_3d(vb,xx+L,yy,zz);			//bottom left
		vertex_normal(vb,-1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,-1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
	vertex_position_3d(vb,xx+L,yy,zz+H);		//top left
		vertex_normal(vb,-1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,1));
}
#endregion west
#region south
if drawSouth
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx,yy+W,zz);			//bottom left
		vertex_normal(vb,-1,-1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx+L,yy+W,zz);		//bottom right
		vertex_normal(vb,1,-1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
		
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy+W,zz);			//bottom left
		vertex_normal(vb,-1,-1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx,yy+W,zz+H);		//top left
		vertex_normal(vb,-1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,2));
}
#endregion south
#region east
if drawEast
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx,yy+W,zz+H);		//top right
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy+W,zz);		//bottom right
		vertex_normal(vb,1,-1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
		
	vertex_position_3d(vb,xx,yy+W,zz+H);		//top right
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx,yy,zz+H);		//top left
		vertex_normal(vb,1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,3));
}
#endregion east
#region top
if drawTop
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx,yy,zz+H);			//bottom left
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
	vertex_position_3d(vb,xx+L,yy,zz+H);		//bottom right
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
	vertex_position_3d(vb,xx+L,yy+W,zz+H);		//top right
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
	vertex_position_3d(vb,xx,yy+W,zz+H);		//top left
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy,zz+H);			//bottom left
		vertex_normal(vb,0,0,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,4));
}
#endregion top
#region bottom
if drawBottom
{
	vertex_begin(vb,global.vf);
	
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
	vertex_position_3d(vb,xx+L,yy,zz);		//bottom right
		vertex_normal(vb,-1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,1);
	vertex_position_3d(vb,xx+L,yy+W,zz);		//top right
		vertex_normal(vb,-1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
		
	vertex_position_3d(vb,xx+L,yy+W,zz);		//top right
		vertex_normal(vb,-1,1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,1,0);
	vertex_position_3d(vb,xx,yy+W,zz);		//top left
		vertex_normal(vb,1,1,-1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,0);
	vertex_position_3d(vb,xx,yy,zz);			//bottom left
		vertex_normal(vb,1,-1,1);
		vertex_color(vb,c_white,1);
		vertex_texcoord(vb,0,1);
		
	vertex_end(vb);
	vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,5));
}
#endregion