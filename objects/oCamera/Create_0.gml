/// @description Insert description here
// You can write your code in this editor

// create a new camera, conserve it's ID to be able to refer to it later
camera_id = camera_create();

// set original camera position to be right on top of player character
var vm = matrix_build_lookat(protag.x, protag.y, -10, protag.x, protag.y, 0, 0, 1, 0)
// 1005x720 is a large enough resolution that conserves the porper aspect ratio
var pm = matrix_build_projection_ortho(720, 516, 1, 10000);

camera_set_view_mat(camera_id, vm);
camera_set_proj_mat(camera_id, pm);

// register this camera to first view camera slot
view_camera[0] = camera_id;

// set camera to follow player
follow = protag;
xTo = x;
yTo = y;