image = 0;
z = 16;
rot = 0;
zrot = 0;
/**/
var tall = false;
if place_meeting(x,y,obj_blockParent)
{
	var wall = instance_nearest(x,y,obj_blockParent);
	if (wall == obj_note)
		z = random_range(16,64);
	else if (wall == obj_computer)
	{
		z = 24;
		zrot = 0;
	}
	if (x > wall.x and x < wall.x+64)
	{
		if (y > wall.y) //south
		{
			rot = 180;
			y ++;
		}
		else //north
		{
			rot = 0;
			y --;
		}
	}
	else if (y > wall.y and y < wall.y+64)
	{
		if (x <= wall.x) //west
		{
			rot = 90;
			x --;
		}
		else
		{
			rot = 270; //east
			x ++;
		}
	}
}