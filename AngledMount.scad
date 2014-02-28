module ScrewHole(screwDiameter, angle)
{
    color("red")
    rotate([angle, 0, 0])
    cylinder(h=100, r=screwDiameter/2, center=true, $fn=64);
}

module AngledMount(l=120, w=50, h=50, wall=2, hole_l=100, hole_w=30, angle=30)
{
    difference()
    {
        // Main box shape, rotated
        rotate([angle, 0, 0])
        difference()
        {
            cube([l, w, h], center=true);
            cube([l-wall, w-wall, h-wall], center=true);
            cube([hole_l, hole_w, h*2], center=true);
        }

        // Cut off the bottom half
        translate([0, 0, -h*1/2])
        cube([l*2, w*2, h], center=true);
    }

    // Base
    difference()
    {
        cube([5+l+wall*4, 5+w+wall*8, wall/2], center=true);

        rotate([angle, 0, 0])
        cube([l-wall, w-wall, h], center=true);
    }
}

module AngledMountFor16x2LCD()
{
    angle = 30;
    screwDiameter = 3;
    lpos = (73 + screwDiameter) / 2; // Horizontal position of screw holes
    wpos = (33 + screwDiameter) / 2; // Vertical position of screw holes

    difference()
    {
        AngledMount(l=84, w=40, h=50, wall=2, hole_l=72, hole_w=27, angle=angle);

        // Screw holes
        translate([ lpos,  wpos, 0]) ScrewHole(screwDiameter, angle);
        translate([-lpos,  wpos, 0]) ScrewHole(screwDiameter, angle);
        translate([ lpos, -wpos, 0]) ScrewHole(screwDiameter, angle);
        translate([-lpos, -wpos, 0]) ScrewHole(screwDiameter, angle);
    }
}

//AngledMount();

AngledMountFor16x2LCD();
