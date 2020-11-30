/// @description Compute average of dialog lvl reqs values while dialog active
/// @arg lvl_reqs array

var average = 0;

var array = argument0;
var len = array_length_1d(array);
for (var i = 0; i < len; ++i)
{
	// compute average, including scaling by player level
	average += array[i];
}

average /= len;
average -= protag.playerLvl;

if (protag.cur_average > 0)
{
	protag.cur_average = (protag.cur_average + average) / 2;
}
else protag.cur_average = average;