use <SortingTray.scad>

module SortingTrayStand(radius = 60, outerRadius = 62, trayHeight = 20, thickness = 1, uprightThickness = 3, numTrays = 5, fn = 128)
{
    totalHeight = trayHeight * (numTrays + 1);

    difference()
    {
        union()
        {
            // Base
            cylinder(r = outerRadius * 1.25, r2 = outerRadius,
                     h = trayHeight, $fn = fn);

            // Uprights
            for ( angle = [0, 120, 240] )
            {
                translate([outerRadius * sin(angle), outerRadius * cos(angle), 0])
                cylinder(h = totalHeight, r = uprightThickness, $fn = fn);
            }
        }

        // Cut out the middle
        translate([0, 0, thickness])
        cylinder(h = totalHeight + 2 * thickness,
                 r = radius - thickness, $fn = fn);

        // Cut a little more out of the uprights
        translate([0, 0, trayHeight])
        cylinder(h = totalHeight + 2 * thickness,
                 r = outerRadius - thickness, $fn = fn);
    }

    // Simulate sorting trays held in rack
    //for ( i = [1 : numTrays] )
    //{
    //    translate([0, 0, trayHeight * i])
    //    SortingTray();
    //}
}

SortingTrayStand();
