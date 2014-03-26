/*
 * Holder for a small resistive touch panel to make a small handheld touch
 * device. Will probably use it as a MIDI controller or something.
 *
 * We will print this object unside down, so references to the top-* bevels
 * will actually be on the bottom of the object.
 */

use <_Common/3rdParty/obiscad/obiscad/bevel.scad>

rotate(a=180, v=[0,1,0])
{
    HandHeldDevice();
}

module HandHeldDevice(size = [70, 55, 8])
{
    // Top-right bevel measurements
    ec1 = [[size[0]/2, 0, size[2]/2], [0,1,0], 0];
    en1 = [ec1[0], [1,0,1], 0];

    // Top-left bevel measurements
    ec2 = [[-size[0]/2, 0, size[2]/2], [0,1,0], 0];
    en2 = [ec2[0], [-1,0,1], 0];

    // Top-front bevel measurements
    ec3 = [[0, -size[1]/2, size[2]/2], [1,0,0], 0];
    en3 = [ec3[0], [0,-1,1], 0];

    // Top-back bevel measurements
    ec4 = [[0, size[1]/2, size[2]/2], [1,0,0], 0];
    en4 = [ec4[0], [0,1,1], 0];

    difference()
    {
        // Main shape
        cube(size, center=true);

        // Cut out for electronics/screen/etc
        translate([0, 0, -size[2] * 0.5 + 1], center=true)
        cube([size[0] - 15, size[1] - 15, size[2] + 5], center=true);

        bevel(ec1, en1, cr = size[2], cres=32, l=size[1]+2); // Top-right bevel
        bevel(ec2, en2, cr = size[2], cres=32, l=size[1]+2); // Top-left bevel
        bevel(ec3, en3, cr = size[2], cres=32, l=size[0]+2); // Top-front bevel
        bevel(ec4, en4, cr = size[2], cres=32, l=size[0]+2); // Top-back bevel
    }
}
