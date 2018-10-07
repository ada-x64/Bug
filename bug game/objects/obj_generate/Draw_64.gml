/// @description Insert description here
// You can write your code in this editor
/*
gpu_set_cullmode(cull_noculling);
gpu_set_blendmode(bm_subtract)
var ww = display_get_gui_width()/4;
var hh = display_get_gui_height();
draw_rectangle_color(0,0,ww,hh,c_white,c_black,c_black,c_white,0);
draw_rectangle_color(display_get_gui_width()-ww,0,display_get_gui_width(),hh,c_black,c_white,c_white,c_black,0);
gpu_set_blendmode(bm_normal);
gpu_set_cullmode(cull_clockwise);