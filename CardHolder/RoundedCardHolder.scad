module RoundedCardHolder(length = 150, cardThickness = 2, slotDepth = 25, fn=64)
{
    difference()
    {
        // Main curved shape
        rotate([0, 90, 0])
        cylinder(h = length, r = 15, center = true, $fn=fn);

        // Remove bottom of cylinder so it sits flat on table
        translate([0, 0, -7])
        cube([length + 2, 40, 20], center = true);

        // Card slot
        color("red")
        translate([0, 0, 20])
        cube([length + 2, cardThickness, slotDepth], center = true);
    }
}

RoundedCardHolder();
