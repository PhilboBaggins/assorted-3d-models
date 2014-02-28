module Architrave(l, r, fn=64)
{
    intersection()
    {
        cylinder(h = l, r = r, $fn=fn);
        cube([r, r, l]);
    }
}

module BracketFace(l, w, h, screwDiameter, fn=64)
{
    difference()
    {
        cube([l, w, h]);

        translate([l * 3 / 4, w * 1 / 4, -h])
        cylinder(h = h * 3, r = screwDiameter / 2, $fn=fn);

        translate([l * 3 / 4, w * 3 / 4, -h])
        cylinder(h = h * 3, r = screwDiameter / 2, $fn=fn);
    }
}

module RightAngleBracket(len1 = 34, len2 = 34, w = 28, h = 1.5, support = 3, screwDiameter = 2.9)
{
    BracketFace(len1, w, h, screwDiameter);

    rotate([0, 270, 0])
    translate([0, 0, -h])
    BracketFace(len2, w, h, screwDiameter);

    if (support > 0)
    {
        rotate([270, 270, 0])
        translate([h, h, 0])
        Architrave(w, support);
    }
}

RightAngleBracket();
