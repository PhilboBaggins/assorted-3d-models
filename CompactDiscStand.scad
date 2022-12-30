CD_RADIUS = 60;
CD_CENTRE_HOLD_RADIUS = 7.5;

module CompactDiscStand(baseThickness = 3,
                        baseRadius = CD_RADIUS + 10,
                        uprightHeight = 120,
                        uprightRadius = CD_CENTRE_HOLD_RADIUS - 0.5,
                        uprightThickness = 1,
                        includeBanding = false,
                        fn = 64)
{
    // Base
    cylinder(h = baseThickness, r = baseRadius, $fn = fn);

    // Upright
    difference()
    {
        union()
        {
            translate([0, 0, baseThickness])
            cylinder(h = uprightHeight, r = uprightRadius, $fn = fn);

            if (includeBanding)
            {
                for (y = [baseThickness : uprightHeight / baseThickness])
                {
                    translate([0, 0, y * baseThickness])
                    cylinder(h = uprightThickness , r = uprightRadius + uprightThickness, $fn = fn);
                }
            }
        }

        translate([0, 0, baseThickness])
        cylinder(h = uprightHeight + 1, r = uprightRadius-uprightThickness, $fn = fn);
    }


}

//CompactDiscStand();

//CompactDiscStand(includeBanding = true);

/*
 * Test prints
 */

CompactDiscStand(baseRadius = 20, uprightHeight = 25);

//translate([50, 0, 0])
//CompactDiscStand(baseRadius = 20, uprightHeight = 25, includeBanding = true);
