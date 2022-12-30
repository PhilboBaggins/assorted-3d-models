module MainShape(cornerRoundness, shortLen, longLen, height, depth, fn)
{
    offset    = cornerRoundness * 1;
    shortLen2 = shortLen - offset;
    longLen2  = longLen  - offset;
    height2   = height   - offset;
    lenDiff   = (longLen2 - shortLen2) / 2; // Difference between length of short and long sides

    hull()
    {
        translate([offset,  offset,              0]) cylinder(r = cornerRoundness, h = depth, $fn = fn);
        translate([offset,  longLen2,            0]) cylinder(r = cornerRoundness, h = depth, $fn = fn);
        translate([height2, lenDiff,             0]) cylinder(r = cornerRoundness, h = depth, $fn = fn);
        translate([height2, shortLen2 + lenDiff, 0]) cylinder(r = cornerRoundness, h = depth, $fn = fn);
    }
}

module DConnectorCover(cornerRoundness = 0.5,
                       shortLen,
                       longLen,
                       height,
                       depth,
                       thickness = 2,
                       screwRadius = 0.5,
                       screwOffset = 0.5,
                       fn = 64)
{
    difference()
    {
        MainShape(cornerRoundness, shortLen + thickness, longLen + thickness, height + thickness, depth, fn);

        translate([thickness / 2, thickness / 2, 0])
        MainShape(cornerRoundness, shortLen, longLen, height, depth, fn);
    }

    offset = (screwRadius + screwOffset) * 9;
    difference()
    {
        translate([0, (offset - thickness) / -2, 0])
        cube([height + thickness, longLen + offset, thickness / 2]);

        // Screw holes
        //translate([height / 2,           screwRadius - screwOffset, -thickness/2]) cylinder(r = screwRadius, h = thickness, $fn = fn);
        //translate([height / 2, longLen + screwRadius + screwOffset, -thickness/2]) cylinder(r = screwRadius, h = thickness, $fn = fn);
    }
}

module DB25Cover()
{
    DConnectorCover(cornerRoundness = 0.5,
                    shortLen = 14.25 + 2,
                    longLen = 16.12 + 2,
                    height = 7.54,
                    depth = 6);
}

DB25Cover();
