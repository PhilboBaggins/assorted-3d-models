Box(50, 80, 20, 2);

translate([0, 0, 50]) Lid(50, 80, 4, 4);

module Box(l, h, d, diff)
{
	difference()
	{
		cube([l, h, d], center = true);
		translate([0, 0, diff]) cube([l-diff, h-diff, d+diff], center = true);
	}
}

module Lid(l, h, d, diff)
{
	union()
	{
		cube([l, h, d], center = true);
		translate([0, 0, -diff]) cube([l-diff, h-diff, d+diff], center = true);
	}
}