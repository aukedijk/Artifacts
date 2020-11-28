/// @description

x += (xTo - x) / 25;
y += (yTo - y) / 25;

if (follow != noone)
{
	// camera follows protag as he moves, rather than waiting for it to reach the border of the screen
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(protag.x, protag.y, -10, protag.x, protag.y, 0, 0, 1, 0);
camera_set_view_mat(camera_id, vm);