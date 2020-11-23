// The dialog system does nothing if we don't tick it
dialog_tick(false);



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

// handle horizontal movement
if (diagonMv)
{
	mvSpd = mvspd / sqrt(2);
}
else
{
	mvSpd = mvspd;
}


var horiz_spd = 0;

if (buttonRight)
{
	horiz_spd = mvSpd;
}
else if (buttonLeft)
{
	horiz_spd = -mvSpd;
} 

x += horiz_spd;

var vert_spd = 0;

if (buttonDown) // up is origin of y-axis
{
	vert_spd = mvSpd;
}
else if (buttonUp)
{
	vert_spd = -mvSpd;
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
else sprite_index = skelly_limited_idle;
