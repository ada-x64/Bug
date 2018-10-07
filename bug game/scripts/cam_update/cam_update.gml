///@func cam_update()
var z = obj_player.z;
var dir = obj_player.dir;

var proj_mat = matrix_build_projection_perspective_fov(-30,16/9,1,32000);
camera_set_proj_mat(global.camera,proj_mat);
var dy = (-(1/2)+(device_mouse_y_to_gui(0)/display_get_gui_height()));
if obj_player.interaction {dy = 0;}
var dx = 0//(-(1/2)+(device_mouse_x_to_gui(0)/display_get_gui_width()));

//first person
var lookat_mat = matrix_build_lookat(obj_player.x,obj_player.y,z,obj_player.x+lengthdir_x(240,dir+15*dx),obj_player.y+lengthdir_y(240,dir+15*dx),z-300*(dy),0,0,1);
camera_set_view_mat(global.camera,lookat_mat);