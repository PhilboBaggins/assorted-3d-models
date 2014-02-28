module Base(length)
{
    difference()
    {
        // Base
        cube([length, 45, 6], center = true);

        // Trim off the front
        translate([0, -27, 0])
        rotate([-25, 0, 0])
        cube([length * 1.5, 20, 30], center = true);

        // Trim off the back
        translate([0, 31, -9])
        rotate([30, 0, 0])
        cube([length * 1.5, 20, 40], center = true);
    }
}

module MainShape(length)
{
    // Upright
    translate([0, 12, 16])
    cube([length, 2, 28], center = true);

    difference()
    {
        Base(length);

        translate([0, 1.5, -1])
        scale([1.2, 0.75, 0.7])
        Base(length);
    }
}

module BlockyCardHolder(length = 170, cardThickness = 2, roundingFactor = 2)
{
    difference()
    {
        minkowski()
        {
            MainShape(length);
            sphere(roundingFactor);
        }

        // Card slot
        color("red")
        rotate([-25, 0, 0])
        translate([0, -12, 4])
        cube([length * 1.5, cardThickness, 20], center = true);
    }
}

BlockyCardHolder();
