///@draw_rectPrism(vb,x,y,z,length,width,height,sprite,drawTop,drawBottom)
///@description Draws a rectangular prism with the top left corner at position (x,y)
///@param x
///@param y
///@param z
///@param length
///@param width
///@param height
///@param sprite
///@param drawTop
///@param drawBottom

var xx			= argument0;
var yy			= argument1;
var zz			= argument2;
var L			= argument3;
var W			= argument4;
var H			= argument5;
var spr			= argument6;
var drawTop		= argument7;
var drawBottom	= argument8;
var drawNorth	= true;
var drawWest	= true;
var drawSouth	= true;
var drawEast	= true;

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