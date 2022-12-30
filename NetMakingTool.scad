
// Something Steve asked me to make

module Parabola(height, point, a, inc, width)
{
    for (x = [-width/2 : inc : width/2])
    {
        translate([x, a * pow(x, 2), 0])
        cube([point, point, height], center = true);
    }
}

module NetMakingTool(height = 3, a = 1/6, inc = 1, width = 30, length = 140, cutoutX = 25, cutoutY = 25)
{
    point = 0.1;

    difference()
    {
        hull()
        {
            Parabola(height, point, a, inc, width);

            translate([-width/2,  length, 0])
            cube([point, point, height], center = true);

            translate([width/2,  length, 0])
            cube([point, point, height], center = true);
        }

        translate([0, 2, 0])
        hull()
        {
            Parabola(height, point, a*2, inc, width*2/3);
        }

        translate([0, length - cutoutY/2 + 1, 0])
        cube([cutoutX, cutoutY, height + 2], center = true);
    }
}

NetMakingTool();
