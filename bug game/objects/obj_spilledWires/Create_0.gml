/// @description Insert description here
// You can write your code in this edit
z = 0;
if !(instance_place(x,y+72,obj_server) xor instance_place(x,y-72,obj_server))
	{rot = choose(0,180);}
else if instance_place(x,y+72,obj_server) 
	{rot = 180;}
else if instance_place(x,y-72,obj_server)
	{rot = 0;}

x -= 32;
y -= 32;
//if rot = 180 {y += 64;}
//layer = layer_get_id("layer_interactable");