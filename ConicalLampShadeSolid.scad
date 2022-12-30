
$fn=64;

module ConicalLampShadeSolid(r1, r2, h1, h2)
{
    hull()
    {
        cylinder(r=r1, h=h1);

        translate([0, 0, h1])
        cylinder(r=r2, h=h2);
    }
}

module ConicalLampShade(r1, r2, h1, h2, thickness)
{
    difference()
    {
        ConicalLampShadeSolid(r1, r2, h1, h2);
        ConicalLampShadeSolid(r1 - thickness/2, r2 - thickness/2, h1, h2);
    }
}

ConicalLampShade(10, 5, 5, 20, 1);
