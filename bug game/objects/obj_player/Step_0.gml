//end game
if keyboard_check(vk_escape) {game_end();}
#region mouse and direction
interaction = computer_interaction //or ...
if !interaction
{
	if keyboard_check(ord("Q"))	{dir -= 90/fps;}
	if keyboard_check(ord("E")) {dir += 90/fps;}

	if device_mouse_x_to_gui(0) != display_get_gui_width()/2
		dir -= (display_get_width()/2 - display_mouse_get_x())/10;
}
display_mouse_set(display_get_width()/2 + (display_get_width()/2  -  display_mouse_get_x())/120,display_mouse_get_y());
if display_mouse_get_y() < window_get_y() {display_mouse_set(display_mouse_get_x(),window_get_y());}
if display_mouse_get_y() > window_get_y()+window_get_height() {display_mouse_set(display_mouse_get_x(),window_get_y()+window_get_height());}
#endregion mouse and direction
#region movement
if !interaction and !inventoryOpen
{
	var xspd = abs(x - xprevious);
	var yspd = abs(y - yprevious);

	//movement calculus
	var dx = 2*(-(1/2)+(device_mouse_x_to_gui(0)/display_get_gui_width()));
	var dy = 2*(-(1/2)+(device_mouse_y_to_gui(0)/display_get_gui_height()));

	var UP = keyboard_check(ord("W")) or keyboard_check(vk_up);
	var DOWN = keyboard_check(ord("S")) or keyboard_check(vk_down);
	var LEFT = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var RIGHT = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var dist_x = 0;
	var dist_y = 0;

	var outside = x < spd or x > room_width-spd or y < spd or y > room_height-spd;
	if UP
	{
		dist_x += lengthdir_x(spd,dir);
		dist_y += lengthdir_y(spd,dir);
	}
	if DOWN
	{
		dist_x += lengthdir_x(spd,dir-180);
		dist_y += lengthdir_y(spd,dir-180);
	}
	if LEFT
	{
		dist_x += lengthdir_x(spd,dir-90);
		dist_y += lengthdir_y(spd,dir-90);
	}
	if RIGHT
	{
		dist_x += lengthdir_x(spd,dir+90);
		dist_y += lengthdir_y(spd,dir+90);
	}
	
		//run
	if keyboard_check_pressed(vk_shift) or (keyboard_check(vk_shift) and (UP or LEFT or RIGHT)) and sprintTimer < 15*fps
		sprint = true;
	if keyboard_check_released(vk_shift) or sprintTimer >= 15*fps or !(UP or LEFT or RIGHT)
		sprint = false;
		
	if sprint
	{
		spd = 2.5+4*((15*fps-sprintTimer)/(15*fps));
		sprintTimer ++;
	}
	else
	{
		spd = 2.5;
		sprintTimer --;
		if sprintTimer < 0 {sprintTimer = 0;}
	}

	//crawl
	if keyboard_check(vk_control)
	{
		crawl = true;
	}
	if keyboard_check_released(vk_control)
	{
		crawl = false;
	}
	if crawl
	{
		z-=4;
		if z < 16 {z = 16;}
		spd = 1;
	}
	else if !jump
	{
		z+=2;
		if z > 64 {z = 64;}
	}
	
	#region collision
	if !debug_noclip
	{
		/* outside room */
		if x+dist_x < 8 or x+dist_x > room_width-8 {x -= xspd*sign(dist_x); dist_x = 0;}
		if y+dist_y < 8 or y+dist_y > room_height-8 {y += yspd*sign(dist_y); dist_y = 0;}
		/**/
		if place_meeting(x+dist_x+8*sign(dist_x),y,obj_blockParent)
		{
			x -= xspd*sign(dist_x);
			dist_x = 0;
		}
		if place_meeting(x,y+dist_y+8*sign(dist_y),obj_blockParent)
		{
			y += yspd*sign(dist_y);
			dist_y = 0;
		}

		if place_meeting(x+dist_x+8*sign(dist_x),y,obj_wiretrap) and !crawl
		{
			x -= xspd*sign(dist_x);
			dist_x = 0;
		}
		if place_meeting(x,y+dist_y+8*sign(dist_y),obj_wiretrap) and !crawl
		{
			y += yspd*sign(dist_y);
			dist_y = 0;
		}
	}
	#endregion collision

	x += dist_x;
	y += dist_y;
}
#endregion movement
#region interaction and collection
interactable = false;
collectable = false;

var dy = (-(1/2)+(device_mouse_y_to_gui(0)/display_get_gui_height()));
var i=x;
var j=y;
var dist = 0;
while (not (place_meeting(i,j,obj_blockParent) or place_meeting(i,j,obj_collectableParent) or i > room_width or i < 0 or j > room_height or j < 0) and dist < 240)
{
	i = x + lengthdir_x(dist,dir);
	j = y + lengthdir_y(dist,dir);
	dist ++;
}
if place_meeting(i,j,obj_blockParent)
{
	var obj = instance_place(i,j,obj_blockParent);
	if selectZ > obj.z + obj.sprite_height
	{
		
	}
		
}
selectX = x+lengthdir_x(dist,dir);
selectY = y+lengthdir_y(dist,dir);
selectZ = z - 300*(dist/240)*dy;

//look for a computer
//emulate "point_in_line" by using point_in_triangle with the two endpoints being the same
if instance_exists(obj_computer) and place_meeting(selectX,selectY,obj_computer)
{
	var obj = instance_nearest(x,y,obj_computer);
	if obj.image == 0 or obj.image == 4 and in_range(selectZ,z + obj.z + 32 - 64,z + obj.z + 16)
	{
		interactable = true;
		if mouse_check_button_released(mb_left) or mouse_check_button_released(mb_right)
		{
			computer_interaction = !computer_interaction;
			keyboard_string = "";
		}
	}
}
if instance_exists(obj_collectableParent) and place_meeting(selectX,selectY,obj_collectableParent)
{
	var obj = instance_nearest(x,y,obj_collectableParent)
	if in_range(selectZ,z + obj.z - 56,z + obj.z + 8)
	{
		collectable = true;
		if mouse_check_button_released(mb_left)
		{
			if inventory[Inventory.leftHand] == noone
			{
				inventory[Inventory.leftHand] = obj.object_index;
				inventorySprite[Inventory.leftHand] = obj.image;
				with obj {instance_destroy();}
			}
			else if inventory[Inventory.leftPocket] == noone
			{
				inventory[Inventory.leftPocket] = inventory[Inventory.leftHand];
				inventorySprite[Inventory.leftPocket] = inventorySprite[Inventory.leftHand];
				inventory[Inventory.leftHand] = obj.object_index;
				inventorySprite[Inventory.leftHand] = obj.image;
				with obj {instance_destroy();}
				
			}
		}
		
		if mouse_check_button_released(mb_right)
		{
			if inventory[Inventory.rightHand] == noone
			{
				inventory[Inventory.rightHand] = obj.object_index;
				inventorySprite[Inventory.rightHand] = obj.image;
				with obj {instance_destroy();}
			}
			else if inventory[Inventory.rightPocket] == noone
			{
				inventory[Inventory.rightPocket] = inventory[Inventory.rightHand];
				inventorySprite[Inventory.rightPocket] = inventorySprite[Inventory.rightHand];
				inventory[Inventory.rightHand] = obj.object_index;
				inventorySprite[Inventory.rightHand] = obj.image;
				with obj {instance_destroy();}
				
			}
		}
	}
}

#region computer stuff
if computer_interaction
{
	display_mouse_set(window_get_x() + window_get_width()/2,window_get_y() + window_get_height()/2);
	if x != obj_computer.x - 64
		{x += round(100*(obj_computer.x - 64 - x)/4)/100; }
	if y != obj_computer.y + 32
		{y += round(100*(obj_computer.y + 32 - y)/4)/100; }
	if dir mod 360 != 0
		{dir -= round((dir mod 360)*100)/100;}
	//cursor_image = 1;
	
	if obj_computer.power_on
	{
		if !computer_processing and !computer_boot
			computer_string = keyboard_string;
		if keyboard_check(vk_enter)
		{
			keyboard_string = "";
			computer_processing = true;
		}
	}
	else
	{
		computer_boot = true;
	}
}

if computer_boot
{
	computer_timer ++;
	if computer_timer > 5*fps
	{
		obj_computer.power_on = true;
		computer_timer = 0;
		computer_boot = false;
	}
}

if computer_processing
{
	{
		computer_timer ++;
		if computer_timer > fps*5
		{
			computer_timer = 0;
			computer_processing = false;
			if computer_string == "debug_noclip"
			{
				debug_noclip = !debug_noclip;
			}
			if computer_string != "sfasdf" //global.level_keycode
				{computer_fail = true;}
		}
	}
}
#endregion computer
#endregion interactables
#region inventory
var leftPocket = keyboard_check(ord("1"));
var leftHand = keyboard_check(ord("2"));
var rightHand = keyboard_check(ord("3"));
var rightPocket = keyboard_check(ord("4"));
inventoryOpen = !interaction and (leftPocket or leftHand or rightHand or rightPocket);
if !interaction
{
	if leftPocket and !(leftHand or rightHand or rightPocket)
	{
		inventorySelected = 0
		inventoryTime ++;
	}
	
	if leftHand and !(leftPocket or rightHand or rightPocket)
	{
		inventorySelected = 1
		inventoryTime ++;
	}
	
	if rightHand and !(leftHand or leftPocket or rightPocket)
	{
		inventorySelected = 2
		inventoryTime ++;
	}
	
	if rightPocket and !(leftHand or rightHand or leftPocket)
	{
		inventorySelected = 3
		inventoryTime ++;
	}
	
	if !(leftHand or rightHand or leftPocket or rightPocket)
	{
		inventorySelected = -1;
		inventoryTime = 0;
	}
}
#endregion inventory