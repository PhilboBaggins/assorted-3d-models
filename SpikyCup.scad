
$fn=64;

module ballCylinder(height, radius)
{
    translate([0, 0, radius])
    cylinder(r=radius, h=height);

    translate([0, 0, radius])
    sphere(r=radius);
}

module SpikyCup(height=100, radius=40, holeRadius=3, wallThickness=2)
{
    stepDegrees = 360 / (holeRadius * 12);

    intersection()
    {
        difference()
        {
            cylinder(r=radius, h=height);

            translate([0, 0, wallThickness])
            ballCylinder(height, radius - wallThickness * 2);

            for (a = [0 : stepDegrees : 360 - stepDegrees])
            {
                x = radius * cos(a);
                y = radius * sin(a);

                translate([x, y, 0])
                cylinder(r=holeRadius, h=height);
            }
        }

        translate([0, 0, -height / 6])
        ballCylinder(height, radius);
    }
}

SpikyCup();
