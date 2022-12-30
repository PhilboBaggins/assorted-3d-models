
$fn=128;

// Dimensions for 5 mm LED
DIAMETER = 5;
HEIGHT = 8.7;
WIDE_BIT_XY = 5.8;
WIDE_BIT_Z = 1;

module LED()
{
    translate([0, 0, HEIGHT - WIDE_BIT_Z])
    cylinder(r=WIDE_BIT_XY/2, h=WIDE_BIT_Z);

    translate([0, 0, DIAMETER/2])
    cylinder(r=DIAMETER/2, h=HEIGHT - DIAMETER/2);

    translate([0, 0, DIAMETER/2])
    sphere(r=DIAMETER/2);
}

module GiantLED(scaleUp=10)
{
    //color("red")
    scale(scaleUp)
    LED();
}

GiantLED();
