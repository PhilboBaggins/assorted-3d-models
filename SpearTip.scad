/*
 * Small spear tip modelled on a Zulu short spear. Made for my father's scout troop.
 */

module SpearTip(length = 180, width = 60, height = 16, thickness = 2)
{
    widestPointX =  length * 8 / 10; // X axis position of widest point

    hull()
    {
        sphere(0.5);
    
        translate([widestPointX, 0, 0])
        cube([1, width, thickness], center = true);

        translate([widestPointX, 0, 0])
        cube([1, 1, height], center = true);

        translate([length - width/3, 0, 0])
        cylinder(r = width/3, height = thickness, center = true);
    }

    translate([length, 0, 0])
    cube([length/4, width/2, thickness], center = true);
}

SpearTip();
