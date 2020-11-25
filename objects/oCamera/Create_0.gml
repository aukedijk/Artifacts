/// @description Insert description here
// You can write your code in this editor

camera_id = camera_create();

var vm = matrix_build_lookat(protag.x, protag.y, -10, protag.x, protag.y, 0, 0, 1, 0)
var pm = matrix_build_projection_ortho(1005, 720, 1, 10000);

camera_set_view_mat(camera_id, vm);
camera_set_proj_mat(camera_id, pm);

view_camera[0] = camera_id;

follow = protag;
xTo = x;
yTo = y;