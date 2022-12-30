
// http://www.foodrepublic.com/2012/03/27/how-make-burger-patties

module BasicShape(r, indentRadius, height, wallThickness, btmThickness, fn)
{
    difference()
    {
        cylinder(r = r, h = height, $fn = fn, center = true);

        translate([0, 0, btmThickness])
        cylinder(r = r-wallThickness, h = height-btmThickness, $fn = fn, center = true);
    }

    intersection()
    {
        cylinder(r = indentRadius, h = height, $fn = fn, center = true);

        translate([0, 0, -indentRadius + btmThickness])
        sphere(indentRadius, $fn = fn);
    }
}

module Pair(r = 60, indentRadius = 100, height = 20, wallThickness = 2, btmThickness = 2, fn = 128)
{
    // Base
    BasicShape(r=r, indentRadius=indentRadius, height=height, wallThickness=wallThickness, btmThickness=btmThickness, fn=fn);

    // Plunger
    translate([0, 0, 20])
    rotate([0, 180, 0])
    //BasicShape(r=r*1.1, indentRadius=indentRadius, height=height, wallThickness=-1, btmThickness=btmThickness, fn=fn); // Without walls
    BasicShape(r=r+wallThickness + 1, indentRadius=indentRadius, height=height, wallThickness=wallThickness, btmThickness=btmThickness, fn=fn); // With walls
}

Pair();
