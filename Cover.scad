use <_Common/CutOuts/ComponentHoles.scad>

$fn = 64;

WIDTH = 70;
LENGTH = 130;
THICKNESS = 2;

module HoleForSquareRedButton(height=40)
{
    cube([11.9, 11.9, height], center=true);
}

module Cover()
{
    yScaling = LENGTH / 7.5;
    xScaling = WIDTH / 4;

    difference()
    {
        cube([LENGTH, WIDTH, THICKNESS]);

        translate([1 * yScaling, 1 * xScaling, 0]) HoleForSmallSilverMissileSwitch();
        translate([1 * yScaling, 2 * xScaling, 0]) HoleForSmallSilverMissileSwitch();
        translate([1 * yScaling, 3 * xScaling, 0]) HoleForSmallSilverMissileSwitch();

        translate([1.4 * yScaling, 1.3 * xScaling, 0]) HoleFor3mmLED();
        translate([1.4 * yScaling, 2.3 * xScaling, 0]) HoleFor3mmLED();
        translate([1.4 * yScaling, 3.3 * xScaling, 0]) HoleFor3mmLED();

        translate([2 * yScaling, 1 * xScaling, 0]) HoleFor3mmLED();
        translate([2 * yScaling, 2 * xScaling, 0]) HoleFor3mmLED();
        translate([2 * yScaling, 3 * xScaling, 0]) HoleFor3mmLED();

        for (yIdx = [3 : 5])
        {
            translate([yIdx * yScaling, 1 * xScaling, 0]) HoleForSquareRedButton();
            translate([yIdx * yScaling, 2 * xScaling, 0]) HoleForSquareRedButton();
            translate([yIdx * yScaling, 3 * xScaling, 0]) HoleForSquareRedButton();
        }
    }
}

module TestPrint()
{
    yScaling = LENGTH / 7.5;
    xScaling = WIDTH / 4;

    difference()
    {
        cube([yScaling * 1.5, xScaling * 2, THICKNESS]);

        translate([-6 + 1   * yScaling, 0.5 * xScaling, 0]) HoleForSmallSilverMissileSwitch();
        translate([-6 + 1.4 * yScaling, 0.8 * xScaling, 0]) HoleFor3mmLED();
        translate([-6 + 1   * yScaling, 1.5 * xScaling, 0]) HoleForSquareRedButton();
    }
}

//Cover();

TestPrint();
