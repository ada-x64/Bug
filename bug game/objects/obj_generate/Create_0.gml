#region position, player
z = 0;
global.instances = ds_list_create();
instance_create_layer(0,0,layer_get_id("layer_ground"),obj_player)
#endregion pp
#region background, cam, room
global.camera = camera_create();
camera_set_update_script(global.camera,cam_update());
window_set_size(1028,576);
window_set_position((display_get_width()-1028)/2,(display_get_height()-576)/2)
surface_resize(application_surface,1028,576);
display_set_gui_size(1028,576);
view_set_hport(0,576);
view_set_wport(0,1028);
view_set_camera(0,global.camera);
view_set_visible(0,true);
room_speed = 60;
var bg_color = make_color_rgb(8,15,14);
gpu_set_fog(true,bg_color,64,512);
background_showcolor = true;
background_color = bg_color;

#endregion bg, cam, room
#region terrain -- should i keep this?
enum T
{
	grassland,
	dirt,
	desert,
	tiles
}
terrain = T.tiles;
bias = 0;
b = random_range(0,10);
#endregion terrain
#region vertex and gpu settings

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
global.vf = vertex_format_end();

vb = vertex_create_buffer();
gpu_set_cullmode(cull_clockwise);
gpu_set_texrepeat(true);
gpu_set_ztestenable(true);
global.vb_blocks = vertex_create_buffer();
gpu_set_alphatestenable(true);
//gpu_set_alphatestref(1);
#endregion vertex and gpu
#region generation
chunksize = 24;
blocksize = 32;
num_chunks_h = ceil(room_width/(chunksize*blocksize));
num_chunks_v = ceil(room_height/(chunksize*blocksize));
//room_width  = num_chunks_h * chunksize * blocksize;
//room_height = num_chunks_v * chunksize * blocksize;
//show_message("h:"+string(room_width)+"/"+string(chunksize*blocksize)+"="+string(room_width/(chunksize*blocksize)));
//show_message("v:"+string(room_height)+"/"+string(chunksize*blocksize)+"="+string(room_height/(chunksize*blocksize)));

global.chunks = array_create_2d(num_chunks_h,num_chunks_v);
for (var i = 0; i<num_chunks_h; i++)
for (var j = 0; j<num_chunks_v; j++)
	{global.chunks[i,j] = array_create_2d(chunksize,chunksize);}

xx = 0;
yy = 0;
x0 = 0 - blocksize*chunksize/2;
y0 = 0 - blocksize*chunksize/2;
x1 = x0 + blocksize*chunksize;
y1 = y0 + blocksize*chunksize;
generate = true;
gen_step = 0;
#endregion generation