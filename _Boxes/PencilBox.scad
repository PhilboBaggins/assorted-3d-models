module PencilBox(l = 100, w = 100, h = 120, wall = 1)
{
	difference()
	{
		cube([l, w, h], center = true);

		translate([0, 0, wall])
		cube([l-wall*2, w-wall*2, h-wall], center = true);
	}
}

PencilBox();
