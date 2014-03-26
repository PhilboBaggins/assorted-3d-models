module ScrewHole(x, y, height, radius, fn)
{
    hull()
    {
        translate([x, y, 1])
        cylinder(h = height, r = radius, $fn = fn);

        translate([x, y, 0])
        cylinder(h = height, r = radius*2/3, $fn = fn);
    }
}

module CpuFanCover(coverSize = 95, thickness = 2, holeSpacing = 35.5, holeRadius = 3, cornerRadius = 8, fn = 64)
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
        ScrewHole( holeSpacing,  holeSpacing, thickness, holeRadius, fn);
        ScrewHole(-holeSpacing,  holeSpacing, thickness, holeRadius, fn);
        ScrewHole( holeSpacing, -holeSpacing, thickness, holeRadius, fn);
        ScrewHole(-holeSpacing, -holeSpacing, thickness, holeRadius, fn);
    }
}

CpuFanCover();
