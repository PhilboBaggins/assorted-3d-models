
$fn=64;

// Dimensions for 5 mm LED
LED_DIAMETER = 5;
LED_HEIGHT = 8.7;
LED_WIDE_BIT_XY = 5.8;
LED_WIDE_BIT_Z = 1;

EXTRA_SPACE_SCALING = 1.1;

module LED(ledDiameter, ledHeight)
{
    color("red")
    {
        translate([0, 0, LED_HEIGHT - LED_WIDE_BIT_Z])
        cylinder(r=LED_WIDE_BIT_XY/2, h=LED_WIDE_BIT_Z);

        translate([0, 0, LED_DIAMETER/2])
        cylinder(r=LED_DIAMETER/2, h=LED_HEIGHT - LED_DIAMETER/2);

        translate([0, 0, LED_DIAMETER/2])
        sphere(r=LED_DIAMETER/2);
    }
}

module BoxyLedTop()
{
    sizeXY = LED_DIAMETER * 1.5;
    sizeZ = LED_HEIGHT + LED_DIAMETER * 0.25;

    difference()
    {
        translate([-sizeXY/2, -sizeXY/2, 0])
        cube([sizeXY, sizeXY, sizeZ]);

        translate([0, 0, sizeZ - LED_HEIGHT])
        scale(EXTRA_SPACE_SCALING)
        LED(LED_DIAMETER, LED_HEIGHT);
    }
}

module LedLedTop(scaling=1.2)
{
    difference()
    {
        color("yellow")
        scale(scaling)
        LED(LED_DIAMETER, LED_HEIGHT);

        translate([0, 0, LED_HEIGHT*scaling - LED_HEIGHT*EXTRA_SPACE_SCALING])
        scale(EXTRA_SPACE_SCALING)
        LED(LED_DIAMETER, LED_HEIGHT);
    }
}

//BoxyLedTop();

LedLedTop();
