px = obj_player.x;
py = obj_player.y;
x = px;
y = py;
var pos = 512
var width = pos*2
instance_deactivate_region(x-pos,y-pos,width,width,false,true);
instance_activate_region(x-pos,y-pos,width,width,true);

if generate
{
	for (var h = 0; h < num_chunks_h; h++)
	for (var v = 0; v < num_chunks_v; v++)
	{
		var a = global.chunks[h,v];
		for (var i = 0; i < chunksize; i++)
		for (var j = 0; j < chunksize; j++)
		{
			if i % 2 == 0
				a[i,j] = choose(0,0,0,0,0,1,1,1,1);
			else a[i,j] = 0;
			if a[i,j] == 1 and (i % 2 == 0) and (j % 4 == 0)
			{
				//instance_create_layer(h*chunksize*blocksize + i*blocksize,v*chunksize*blocksize + j*blocksize,layer_get_id("layer_ground"),obj_server)
			}
		}
		global.chunks[h,v] = a;
	}
	generate = false;
}

if keyboard_check_released(vk_tab)
	{room_restart();}