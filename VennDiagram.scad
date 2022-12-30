$fn = 128;

module OverlapPiece(r1, r2, height, moveDistance)
{
	intersection()
	{
		translate([-moveDistance, 0, 0]) cylinder(r = r2, h = height); // Circle 1
		translate([ moveDistance, 0, 0]) cylinder(r = r2, h = height); // Circle 2
	}
}

module VennDiagram(r1 = 50, r2 = 50, height = 5, intersectPercentage = 30, border = 1)
{
	moveDistance = (r1 + r2) / 2 / 100 * (100 - intersectPercentage);

	difference()
	{
		union()
		{
			translate([-moveDistance, 0, 0]) cylinder(r = r1, h = height); // Circle 1
			translate([ moveDistance, 0, 0]) cylinder(r = r2, h = height); // Circle 2
		}

		translate([(r1 - r2) / 2, 0, height - border])
		difference()
		{
			OverlapPiece(r1, r2, border, moveDistance);
			OverlapPiece(r1 - border, r2 - border, border, moveDistance);
		}
	}
}

module SplitVennDiagram(r1 = 50, r2 = 50, height = 5, intersectPercentage = 60)
{
	moveDistance = (r1 + r2) / 2 / 100 * (100 - intersectPercentage);

	translate([-r1, 0, 0])
	difference()
	{
		translate([-moveDistance, 0, 0]) cylinder(r = r1, h = height); // Circle 1
		translate([ moveDistance, 0, 0]) cylinder(r = r2, h = height); // Circle 2
	}

	translate([r2, 0, 0])
	difference()
	{
		translate([ moveDistance, 0, 0]) cylinder(r = r2, h = height); // Circle 2
		translate([-moveDistance, 0, 0]) cylinder(r = r1, h = height); // Circle 1
	}

	// Middle piece
	OverlapPiece(r1, r2, height, moveDistance);
}

VennDiagram();

//SplitVennDiagram();
