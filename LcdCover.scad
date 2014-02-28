module LcdCover(height = 8.2, wall = 2)
{
    length = 82;
    width = 37;
    holeLength = 72;
    holeWidth = 27;

    difference()
    {
        // Main shape
        cube([length, width, height], center=true);

        // Hollow out inside
        translate([0, 0, -wall])
        cube([length-wall, width-wall, height], center=true);

        // Cut hole for LCD
        cube([holeLength, holeWidth, height*2], center=true);
    }
}

rotate([180, 0, 0]) // Easier to print upside down
LcdCover();
