rot = 0;
xscale = 1;
dir = 0;
z = 64;
spd = 2;
gravspd = 3;

jumpspd = 5;
jumptimer = 0;
jumpscale = 0;
jump = false;
crawl = false;
sprintTimer = 0;
sprintTime = 2.5*fps;
sprint = false;

x = room_width/2;
y = room_height/2;

cursor_image = 0;
interaction = false;
collectable = false;
interactable = false;

computer_interaction = false;
computer_ready = false;
computer_processing = false;
computer_string = "";
computer_timer = 0;
computer_fail = false;
computer_boot = false;

debug_noclip = false;

enum Cursor
{
	regular,
	inverted,
	interact,
	wait,
	select,
	investigate
}

enum Inventory
{
	leftPocket,
	leftHand,
	rightHand,
	rightPocket
}
for (var i = 0; i < 4; i++)
{
	inventory[i] = noone;
	inventorySprite[i] = -1;
}
inventorySelected = -1;
inventoryTime = 0;
inventoryOpen = false;

selectX = x;
selectY = y;
selectZ = z;
