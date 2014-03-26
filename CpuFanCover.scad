module CpuFanCover(coverSize = 95, thickness = 2, holeSpacing = 35, holeRadius = 3, cornerRadius = 10, fn = 64)
{
    cornerRoundingPos = coverSize/2 - cornerRadius;

    difference()
    {
        // Main shape with rounded corners
        hull()
        {
            translate([cornerRoundingPos, cornerRoundingPos, 0])
            cylinder(r = cornerRadius, h = thickness, $fn = fn);

            translate([-cornerRoundingPos, cornerRoundingPos, 0])
            cylinder(r = cornerRadius, h = thickness, $fn = fn);

            translate([cornerRoundingPos, -cornerRoundingPos, 0])
            cylinder(r = cornerRadius, h = thickness, $fn = fn);

            translate([-cornerRoundingPos, -cornerRoundingPos, 0])
            cylinder(r = cornerRadius, h = thickness, $fn = fn);
        }

        // Screw holes
        translate([holeSpacing, holeSpacing, 0])
        cylinder(h = thickness, r = holeRadius, $fn = fn);

        translate([-holeSpacing, holeSpacing, 0])
        cylinder(h = thickness, r = holeRadius, $fn = fn);

        translate([holeSpacing, -holeSpacing, 0])
        cylinder(h = thickness, r = holeRadius, $fn = fn);

        translate([-holeSpacing, -holeSpacing, 0])
        cylinder(h = thickness, r = holeRadius, $fn = fn);
    }
}

CpuFanCover();
