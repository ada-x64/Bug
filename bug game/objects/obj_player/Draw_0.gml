/**/
draw_set_lighting(true);
var col = make_color_rgb(232,208,170);
var col_ambient = make_color_rgb(36,6,99);
draw_light_define_ambient(col);

draw_set_color(c_white);
if !computer_interaction
	draw_plane(selectX,selectY,selectZ,4,8,0,0,ico_cursors,cursor_image,true);

//draw_light_define_point(0,x+lengthdir_x(64,dir),y+lengthdir_y(64,dir),z,256,c_white);
//draw_light_enable(0,true);