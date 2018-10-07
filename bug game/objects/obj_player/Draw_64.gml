gpu_set_cullmode(cull_noculling);
#region debug
draw_set_font(fnt_debug);
draw_set_color(c_white);
/**/
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_text(0,0,"fps="+string(fps));
draw_text(0,8,"fps_real="+string(fps_real));
draw_text(0,16,"select coords: ("+string(selectX)+","+string(selectY)+","+string(selectZ)+")")
/*draw_text(0,16,"dir="+string(dir));
draw_text(0,24,"active instances: "+string(instance_count));
//draw_text(0,32,"drawn tiles = "+string(obj_generate.drawn_tiles));
draw_text(0,40,"(x,y,z)=("+string(x)+","+string(y)+","+string(z)+")");
draw_text(0,48,"jumptimer="+string(jumptimer));
draw_text(0,56,"jumpscale="+string(jumpscale));
draw_text(0,64,"outside room? :: "+string(x > room_width or x<0 or y>room_height or y<0));
draw_text(0,72,"num_chunks = ("+string(obj_generate.num_chunks_h)+","+string(obj_generate.num_chunks_v)+")");
draw_text(0,80,"gui size = ("+string(display_get_gui_width())+","+string(display_get_gui_height())+")")
/**
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1);
draw_set_color(c_gray);
draw_circle(display_get_gui_width()-48,32,16,1);
draw_set_color(c_white);
draw_arrow(display_get_gui_width()-48,32,display_get_gui_width()-48 + lengthdir_x(16,dir),32+lengthdir_y(16,dir),8)
draw_text(display_get_gui_width()-64,32,"W");
draw_text(display_get_gui_width()-32,32,"E");
draw_text(display_get_gui_width()-48,16,"N");
draw_text(display_get_gui_width()-48,48,"S");
*/
#endregion debug
#region interactables and cursor
#region cursor
cursor_image = Cursor.regular;
if inventoryOpen
{
	cursor_image = Cursor.inverted;
	if inventory[inventorySelected] != noone
	{
		cursor_image = Cursor.investigate;
		if interactable
		{
			cursor_image = Cursor.select;
		}
	}
}
else if collectable
{
	var obj = instance_nearest(selectX,selectY,obj_collectableParent)
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,string(obj.x)+","+string(obj.y)+","+string(obj.rot));
	cursor_image = Cursor.select;
}
else if interactable and !computer_interaction
	{cursor_image = Cursor.interact;}
else if computer_processing or computer_boot
	{cursor_image = Cursor.wait;}
else if computer_interaction
	{cursor_image = Cursor.inverted;}
else {cursor_image = Cursor.regular;}

window_set_cursor(cr_none);
//draw_sprite(ico_cursors,cursor_image,display_get_gui_width()/2, display_get_gui_height()/2);
#endregion cursor
#region computer
if computer_interaction
{
	draw_set_font(fnt_computer);
	draw_set_color(c_white);
	var xx = 261+34;
	var yy = 151+16;
	if obj_computer.power_on
	{
		if current_time mod 2 == 0 //and computer_ready
		{
			draw_text(xx,yy,"keycode ready:");
			if !computer_processing
			{
				if !computer_fail
					draw_text(xx,yy+18,keyboard_string);
				else
				{
					draw_text(xx,yy+18,"incorrect keycode");
					draw_text(xx,yy+36,keyboard_string);
				}	
			}
			else
			{
				draw_text(xx,yy+18,computer_string);
				draw_text(xx,yy+36,"processing . . .");
			}
		}
	}
	else if computer_boot
	{
		if current_time mod 2 == 0
		{
			draw_text(xx+128,yy+128,"booting . . .");
		}
	}
}
#endregion computer
#endregion interactables
#region status
gpu_set_blendmode(bm_subtract);
var r = display_get_gui_height() + 32 + display_get_gui_height()*(fps*15 - sprintTimer)/(fps*15);
draw_circle_color(display_get_gui_width()/2,display_get_gui_height()/2,r,c_black,c_ltgray,false);
gpu_set_blendmode(bm_normal);
#endregion status
#region inventory
//inventory
var xx = display_get_gui_width()/2;
var yy = display_get_gui_height() - 32;
var scale;
for (var i = 0; i < 4; i ++)
{
	scale[i] = 1;
	if inventorySelected == i
	{
		scale[i] = 1 + 1/4*(1+sin(inventoryTime/15))
	}
}

if inventorySprite[0] != -1
	draw_sprite_ext(spr_collectables,inventorySprite[0],xx-80,yy,scale[0],scale[0],0,c_white,1);
draw_sprite_ext(spr_inventoryPocket,0,xx-80,yy,scale[0],scale[0],0,c_white,1);

if inventorySprite[1] != -1
{
	draw_sprite_ext(spr_collectables,inventorySprite[1],xx-40,yy,scale[1],scale[1],0,c_white,1);
	draw_plane(x+lengthdir_x(36,dir),y+lengthdir_y(36,dir),z,32,32,dir-180,0,spr_collectables,inventorySprite[1],false);
}
draw_sprite_ext(spr_inventory,0,xx-40,yy,scale[1],scale[1],0,c_white,1);

if inventorySprite[2] != -1
{
	draw_sprite_ext(spr_collectables,inventorySprite[2],xx+8,yy,scale[2],scale[2],0,c_white,1);
	draw_plane(x+lengthdir_x(36,dir),y+lengthdir_y(36,dir),z,32,32,dir-180,0,spr_collectables,inventorySprite[2],false);
}
draw_sprite_ext(spr_inventory,0,xx+8 ,yy,scale[2],scale[2],0,c_white,1);

if inventorySprite[3] != -1
	draw_sprite_ext(spr_collectables,inventorySprite[3],xx+48,yy,scale[3],scale[3],0,c_white,1);
draw_sprite_ext(spr_inventoryPocket,0,xx+48,yy,scale[3],scale[3],0,c_white,1);

if inventoryOpen and inventorySelected != -1
{

	yy = yy - 64;
	switch inventorySelected
	{
		case 0:
		{
			xx = xx-80-64;
			break;
		}
		case 1:
		{
			xx = xx-40-64;
			break;
		}
		case 2:
		{
			xx = xx+8-64;
			break;
		}
		case 3:
		{
			xx = xx+48-64;
			break;
		}
	}
	
	var title = "";
	var description = "";
	switch inventory[inventorySelected]
	{
		case obj_note:
		{
			title = "Note";
			description = "Chicken scratch. There might be something on here, if you take a closer look.";
			break;
		}
		default:
		{
			title = "Nothing";
			description = "It's empty.";
		}
	}
	draw_set_color(make_color_rgb(255,255,225));
	draw_set_font(fnt_tahoma);
	var H = 8+string_height_ext(title,string_height("A")+1,96)+string_height_ext(description,string_height("A")+1,96);
	var h = 8+string_height_ext(description,string_height("A")+1,96);
	
	draw_roundrect(xx-8,yy+32-21-H,xx+128,yy+32,false);
	draw_set_color(c_black);
	draw_roundrect(xx-8,yy+32-21-H,xx+128,yy+32,true);
	draw_sprite(ico_info,0,xx,yy+32-8-H);
	draw_set_color(make_color_rgb(255,255,225));
	draw_triangle(xx+64,yy+32,xx+72,yy+31,xx+72,yy+40,false);
	draw_set_color(c_black);
	draw_line(xx+64,yy+32,xx+72,yy+40);
	draw_line(xx+72,yy+32,xx+72,yy+40);
	draw_set_font(fnt_tahomaBold);
	draw_text_ext(xx+24,yy+32-8-H,title,string_height("A")+1,96);
	draw_set_font(fnt_tahoma);
	draw_text_ext(xx+24,yy+32-h,description,string_height("A")+1,96);
}

#endregion inventory
gpu_set_cullmode(cull_clockwise);
