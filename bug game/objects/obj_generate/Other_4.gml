generate = true;
xx = obj_player.x;					//center
yy = obj_player.y;
x0 = obj_player.x - blocksize*chunksize/2; //top left
y0 = obj_player.y - blocksize*chunksize/2; 
x1 = x0 + blocksize*chunksize;				//bottom right
y1 = y0 + blocksize*chunksize;
gen_step = 0;

draw_set_lighting(true);
draw_light_define_point(0,room_width/2,room_height/2,10,200,c_white);
draw_light_enable(0,true);