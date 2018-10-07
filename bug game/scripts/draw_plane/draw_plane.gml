///@draw_rectPrism(vb,x,y,z,width,height,rotation,sprite,image,face_player)
///@description Draws a plane with the top left corner at position (x,y)
///@param x
///@param y
///@param z
///@param width
///@param height
///@param rotation
///@param z-rotation
///@param sprite
///@param image
///@param facePlayer

var xx			= argument0;
var yy			= argument1;
var zz			= argument2;
var W			= argument3;
var H			= argument4;
var rot			= argument5;
var zrot		= argument6;
var spr			= argument7;
var image		= argument8;
var facePlayer	= argument9;

if facePlayer {rot = obj_player.dir+90}

var vb = global.vb_blocks;
var vf = global.vf;
var tex
if spr == -1 {tex = -1;}
else tex = sprite_get_texture(spr,image);
var ww = W;
var wx = lengthdir_x(ww,rot);
var wy = lengthdir_y(ww,rot);
var hh = lengthdir_x(H,zrot);

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

/*

var w = lengthdir_y(W,rot);
W = lengthdir_x(W,rot);

var vb = global.vb_blocks;
gpu_set_cullmode(cull_noculling);
vertex_begin(vb,global.vf);
	
vertex_position_3d(vb,xx+w,yy,zz);			//bottom left
	vertex_normal(vb,-1,1,-1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,0,1);
vertex_position_3d(vb,xx+w,yy+W,zz);		//bottom right
	vertex_normal(vb,-1,-1,-1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,1,1);
vertex_position_3d(vb,xx+w,yy+W,zz+H);		//top right
	vertex_normal(vb,-1,-1,1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,1,0);
		
		
vertex_position_3d(vb,xx+w,yy,zz);			//bottom left
	vertex_normal(vb,-1,1,-1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,0,1);
vertex_position_3d(vb,xx+w,yy+W,zz+H);		//top right
	vertex_normal(vb,-1,-1,1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,1,0);
vertex_position_3d(vb,xx+w,yy,zz+H);		//top left
	vertex_normal(vb,-1,1,1);
	vertex_color(vb,c_white,1);
	vertex_texcoord(vb,0,0);
		
vertex_end(vb);
vertex_submit(vb,pr_trianglelist,sprite_get_texture(spr,image));