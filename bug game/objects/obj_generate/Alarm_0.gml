/// @description chunk management
/*
//build chunk at player location
chunksize = 32;
xx = obj_player.x;
yy = obj_player.y;
x0 = obj_player.x - 16*chunksize/2;
y0 = obj_player.y - 16*chunksize/2;
x1 = x0 + 16*chunksize;
y1 = y0 + 16*chunksize;
/**************************
(x0,y0) o//////////
		/         /
		/    o (xx,yy)
		/         /
		//////////o (x1,y1)
**************************

//reset chunks
ds_list_clear(global.instances);
var a,t,i,j,k;
for (i = 0; i<9; i++)
{
	a = global.chunks[i];
	
	for (j=0; j<chunksize; j++)
	for (k=0; k<chunksize; k++)
	{
		if instance_exists(a[j,k])
			instance_destroy(a[j,k]);
	}
}

#region generate chunks - AUTOMATE THIS CODE
//top left chunk
var a = global.chunks[0];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0-chunksize*16+(i*16),y0+chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[0] = a;

//top middle chunk
var a = global.chunks[1];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+(i*16),y0+chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[1] = a;

//top right chunk
var a = global.chunks[2];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+chunksize*16+(i*16),y0+chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[2] = a;

//middle left chunk
var a = global.chunks[3];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0-chunksize*16+(i*16),y0+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[3] = a;

//middle chunk
var a = global.chunks[4];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+(i*16),y0+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[4] = a;

//middle right chunk
var a = global.chunks[5];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+chunksize*16+(i*16),y0+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[5] = a;

//bottom left chunk
var a = global.chunks[6];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0-chunksize*16+(i*16),y0-chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[6] = a;

//bottom middle chunk
var a = global.chunks[7];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+(i*16),y0-chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[7] = a;

//bottom right chunk
var a = global.chunks[8];
for (var i = 0; i < chunksize; i++)
{
	for (var j = 0; j < chunksize; j++)
	{
		var t = instance_create_layer(x0+chunksize*16+(i*16),y0-chunksize*16+(j*16),layer_get_id("layer_ground"),obj_tile);
		t.terrain = terrain;
		a[i,j] = t;
		ds_list_add(global.instances,t);
	}
}
global.chunks[8] = a;
#endregion generate chunks