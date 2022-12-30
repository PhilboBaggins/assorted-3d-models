module RiotShield(height = 30, width = 20, depth = 2, rim = 0.25)
{
    difference()
    {
        hull()
        {
            cube([height, width/2, depth]);

            translate([-height/12, 0, 0])
            cube([height, width/2, depth/2]);

            translate([0, width/2, 0])
            cube([height, width/4, depth/2]);

            translate([0, -width/4, 0])
            cube([height, width/4, depth/2]);
        }

        translate([height/10, rim*2, 0])
        cube([2, width/2 -rim*4,  depth]);
    }

    translate([0, width/2, depth])
    cube([height, rim, rim]);

    translate([0, 0, depth])
    cube([height, rim, rim]);

    translate([0, 0, depth])
    cube([rim, width/2, rim]);

    translate([height/4, 0, depth])
    cube([rim, width/2, rim]);

    translate([height-rim, 0, depth])
    cube([rim, width/2, rim]);
}

module RiotShield2(height = 30, width = 20, depth = 2, rim = 0.25)
{
    difference()
    {
        hull()
        {
            cube([height, width/2, depth]);

            translate([-height/12, 0, 0])
            cube([height, width/2, depth/2]);

            translate([0, width/2, 0])
            cube([height, width/4, depth/2]);

            translate([0, -width/4, 0])
            cube([height, width/4, depth/2]);
        }

        translate([height/10, rim*2, 0])
        cube([2, width/2 -rim*4,  depth]);

        translate([rim, rim, depth-rim])
        cube([height - rim*2, width/2 - rim*2, rim]);
    }

    translate([height/4, 0, depth - rim])
    cube([rim, width/2, rim]);
}

//translate([0, -25, 0])
//RiotShield();

RiotShield2();
