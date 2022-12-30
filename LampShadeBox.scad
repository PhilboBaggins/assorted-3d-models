
$fn = 64;

THICKNESS = 2;
SIZE_X = 50;
SIZE_Y = 100;
MARGIN = THICKNESS * 5;
NUM_HOLES = 0;

module LampShadePanelMainShape()
{
    difference()
    {
        difference()
        {
            cube([SIZE_X, SIZE_Y, THICKNESS * 2], center=true);

            translate([0, 0, THICKNESS])
            cube([SIZE_X - MARGIN * 2, SIZE_Y, THICKNESS * 2], center=true);
        }

        translate([SIZE_X / 2, SIZE_Y / -2, -THICKNESS])
        rotate([0, 360-45, 0])
        cube([MARGIN, SIZE_Y, THICKNESS * 2]);

        translate([SIZE_X / -2, SIZE_Y / 2, -THICKNESS])
        rotate([0, 360-45, 180])
        cube([MARGIN*3, SIZE_Y, THICKNESS * 2]);
    }
}

module LampShadePanel()
{
    //difference()
    {
        LampShadePanelMainShape();

        for (a = [0 : 1 : NUM_HOLES - 1])
        {
            x = MARGIN + rands(0, SIZE_X - MARGIN * 2, 3)[0] - SIZE_X / 2;
            y = MARGIN + rands(0, SIZE_Y - MARGIN * 2, 3)[0] - SIZE_Y / 2;

            color(rands(0, 1.0, 3))
            translate([x, y, -THICKNESS*2])
            rotate(rands(0, 90, 3) - [45, 45, 45])
            cylinder(r=rands(0.1, 1.5 ,1)[0], h=THICKNESS*5);
        }
    }
}

module LampShadeBox()
{
    color("red")  translate([0, SIZE_X /  2 + THICKNESS, 0]) rotate([90, 0,   0]) LampShadePanel();
    color("red")  translate([0, SIZE_X / -2 - THICKNESS, 0]) rotate([90, 0, 180]) LampShadePanel();
    color("blue") translate([SIZE_X / -2 - THICKNESS, 0, 0]) rotate([90, 0,  90]) LampShadePanel();
    color("blue") translate([SIZE_X /  2 + THICKNESS, 0, 0]) rotate([90, 0, 270]) LampShadePanel();
}

//LampShadePanel();
LampShadeBox();
