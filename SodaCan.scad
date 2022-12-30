
// TODO: Get actual measurements

module MainShape()
{
	hull()
	{
		translate([])
		cylinder(  9, 50, 50, centre=true);

		translate([0, 0, 9])
		cylinder(105, 66, 66, centre=true);

		translate([0, 0, 9+105])
		cylinder(128-9-105, 54, 54, centre=true);
	}
}

module SodaCan()
{
	difference()
	{
		MainShape();

	}
}

SodaCan();
