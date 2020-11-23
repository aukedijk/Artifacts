/// @description Insert description here
// You can write your code in this editor

x += (xTo - x) / 25;
y += (yTo - y) / 25;

if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(protag.x, protag.y, -10, protag.x, protag.y, 0, 0, 1, 0);
camera_set_view_mat(camera_id, vm);