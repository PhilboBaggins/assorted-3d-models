/*
 * This clip is designed to fit on the filament spool supplied by Ultimaker
 * to stop it from uncoiling after being removed from the printer
 */

module Buffer(radius, width, fn)
{
    difference()
    {
        cylinder(r = radius, h = width, $fn = fn);

        translate([-width/4, 0, 0])
        cube([width/2, width/4, width]);
    }
}

module MainShape(spoolWidth, bracketWidth, overhangLength, overhangDepth, thickness, fn)
{
    spoolWidth = spoolWidth + thickness;

    cube([spoolWidth, bracketWidth, thickness]);

    cube([thickness, bracketWidth, overhangLength]);

    translate([spoolWidth, 0, 0])
    cube([thickness, bracketWidth, overhangLength]);

    rotate([0, 90, 90])
    translate([-overhangLength + overhangDepth, -thickness, 0])
    Buffer(overhangDepth, bracketWidth, fn);

    rotate([0, 270, 270])
    translate([overhangLength - overhangDepth, spoolWidth, 0])
    Buffer(overhangDepth, bracketWidth, fn);
}

module FilamentSpoolClip(spoolWidth = 53.88, bracketWidth = 28, overhangLength = 12, overhangDepth = 2, thickness = 2, holeRadius = 7, fn = 128)
{
    difference()
    {
        MainShape(spoolWidth, bracketWidth, overhangLength,
                  overhangDepth, thickness, fn);

        translate([spoolWidth / 2, bracketWidth / 2, 0])
        cylinder(r = holeRadius, thickness, $fn = fn);
    }
}

FilamentSpoolClip();
