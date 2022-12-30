module SortingTray(radius = 60, height = 20, thickness = 1, fn = 128, holeRadius)
{
    holeSpacing = holeRadius * 2.5;

    numHoles = radius * 2 / holeSpacing + 1;

    difference()
    {
        cylinder(h = height, r = radius, $fn = fn);

        translate([0, 0, thickness])
        cylinder(h = height * 2, r = radius - thickness * 2, $fn = fn);

        // Drill a bunch of holes in the bottom
        for ( x = [-numHoles / 2 + 0 : numHoles / 2 - 0] )
        {
            for ( y = [-numHoles / 2 + 0 : numHoles / 2 - 0] )
            {
                // Test whether hole is within the circular area of the tray
                if (pow(x * holeSpacing, 2) + pow(y * holeSpacing, 2)
                    < pow(radius - thickness * 2 - holeRadius, 2))
                {
                    translate([x * holeSpacing, y * holeSpacing, -height])
                    cylinder(h = height * 4, r = holeRadius, $fn = fn);
                }
            }
        }

        // Cut out rim around the bottom so it's stackable
        translate([0, 0, -thickness])
        difference()
        {
            cylinder(thickness * 2, r = radius + thickness, $fn = fn);
            translate([0, 0, -thickness * 2])
            cylinder(thickness * 6, r = radius - thickness * 2, $fn = fn);
        }
    }
}

//SortingTray(holeRadius = 5);

//SortingTray(holeRadius = 4);

SortingTray(holeRadius = 3);

//SortingTray(holeRadius = 2);

//SortingTray(holeRadius = 1);
