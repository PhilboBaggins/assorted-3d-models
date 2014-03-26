module mainShape(l, h, cornerRadius)
{
    hull()
    {
        translate([1*l, 0*l, 0]) cylinder(r=cornerRadius, h=h); // Front right
        translate([6*l, 0*l, 0]) cylinder(r=cornerRadius, h=h); // Front left
        translate([7*l, 1*l, 0]) cylinder(r=cornerRadius, h=h); // Left side
        translate([7*l, 2*l, 0]) cylinder(r=cornerRadius, h=h); // Left side
        translate([6*l, 3*l, 0]) cylinder(r=cornerRadius, h=h); // Rear left
        translate([1*l, 3*l, 0]) cylinder(r=cornerRadius, h=h); // Rear right
        translate([0*l, 2*l, 0]) cylinder(r=cornerRadius, h=h); // Right side
        translate([0*l, 1*l, 0]) cylinder(r=cornerRadius, h=h); // Right side
        translate([1*l, 1*l, 0]) cylinder(r=cornerRadius/4, h=h*9/7); // Roof right
        translate([6*l, 1*l, 0]) cylinder(r=cornerRadius/4, h=h*9/7); // Roof left
    }
}

module bunker(l=30, h=85, cornerRadius=15)
{
    difference()
    {
        union()
        {
            mainShape(l, h, cornerRadius);

//            // Floor
//            translate([-50, -50, 0])
//            cube([300, 200, 2]);
        }

        // Hollow inside
        translate([0, 0, -10])
        mainShape(l, h, cornerRadius*6/7);

        // Slits in front walls
        translate([1*l + 5, -1*l, h*2/3]) cube([l*2, l, h/7]);
        translate([4*l - 5, -1*l, h*2/3]) cube([l*2, l, h/7]);

        // Slits in side walls
        rotate(315, [0,0,1]) translate([-0.8*l + 5, 0*l, h*2/3]) cube([l*1.3, l, h/7]);
        rotate(45, [0,0,1]) translate([4.5*l - 5, -5*l, h*2/3]) cube([l*1.3, l, h/7]);
    }
}

$fn = 20;
bunker();
