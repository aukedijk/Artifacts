// The dialog system does nothing if we don't tick it (= have it fetch new dialog)
dialog_tick(false); // false is to force dialog to play only when previous dialog is finished playing

// save mvspd value for diagonal mv support
var mvSpd = mvspd;

var buttonRight = keyboard_check(ord("D"));
var buttonLeft = keyboard_check(ord("A"));

var buttonUp = keyboard_check(ord("W"));
var buttonDown = keyboard_check(ord("S"));

// check for diagonal movement support
var horizInput = buttonRight || buttonLeft;
var vertInput = buttonUp || buttonDown;
var diagonMv = horizInput && vertInput;

var horiz_spd = 0;
var vert_spd = 0;

// handle horizontal movement
if (!inDialog)
{
	if (diagonMv)
	{
		mvSpd = mvspd / sqrt(2);
	}
	else
	{
		mvSpd = mvspd;
	}


	

	if (buttonRight)
	{
		horiz_spd = mvSpd;
	}
	else if (buttonLeft)
	{
		horiz_spd = -mvSpd;
	} 

	x += horiz_spd;

	if (buttonDown) // up is origin of y-axis
	{
		vert_spd = mvSpd;
	}
	else if (buttonUp)
	{
		vert_spd = -mvSpd;
	} 
}

y += vert_spd;

// force collision with buildings
if collision_line(x, y, xprevious, yprevious, all, true, true)
{
    x = xprevious;
    y = yprevious;
}


// animations
if (horiz_spd > 0)
{
	sprite_index = skelly_walk_right
}
else if(horiz_spd < 0)
{
	sprite_index = skelly_walk_left;
}
else
{
	if (facingLeft)
	{
		sprite_index = protag_mal_idle_left;
	}
	else sprite_index = protag_mal_idle;
}