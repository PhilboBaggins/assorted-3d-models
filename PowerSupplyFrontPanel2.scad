use <_Common/CutOuts/ComponentHoles.scad>

use <_Common/3rdParty/TextGenerator.scad>
use <_Common/3rdParty/MCAD/boxes.scad>

facePlateLength = 254;
facePlateWidth  = 98;
facePlateThickness_1 = 1.5;
facePlateThickness_2 = 3;

module CompletePanel()
{
    cube([facePlateLength, facePlateWidth, facePlateThickness_1]);

    translate([3, 3, 0])
    cube([facePlateLength - 6, facePlateWidth - 6, facePlateThickness_2]);
}

module PowerSupplyFrontPanel()
{
    row1 = 15;
    row2 = 30;
    row3 = 55;
    row4 = 80;

    difference()
    {
         CompletePanel();

        // 5 sets of screw/orange connectors: -12, -5, 3.3, +12, +5
        for ( i = [0 : 4] )
        {
            translate([18 + 36 * i, row4, 0]) HoleFor5mmDiffusedLED();
            translate([28 + 36 * i, row4, 0]) HoleForSmallSilverMissileSwitch();

            translate([23 + 36 * i, row3, 0])
            //rotate([0, 0, 315])
            rotate([0, 0, 335])
            HoleFor4PinPanelMountScrewTerm();
        }

        // 7 pairs of banana plugs: -12, -5, 3.3, +12, +12, +5, +5
        //bananaPlugLabels = ["-12", "-5", "3.3", "+12", "+12", "+5", "+5"];
        for ( i = [0 : 6] )
        {
            translate([17 + 26 * i, row1, 0]) HoleForBananaPlug();
            translate([17 + 26 * i, row2, 0]) HoleForBananaPlug();

            //translate([17 + 26 * i, row1 - 9, facePlateThickness_2])
            //scale([0.5, 0.5, 1])
            //drawtext(bananaPlugLabels[i]);
            //drawtext("AAA");
        }

        // Lower right corner - USB connectors
        translate([210, row1, 0]) HoleForUSBTypeAFemale();
        translate([210, row2, 0]) HoleForUSBTypeAFemale();
        translate([230, row1, 0]) HoleForUSBTypeAFemale();
        translate([230, row2, 0]) HoleForUSBTypeAFemale();

        // Top right corner
        translate([212, row3, 0]) HoleForSmallDXVoltMeter();
        translate([212, row4, 0]) HoleForSmallDXVoltMeter();
        translate([239, row3, 0]) HoleForSmallSilverMissileSwitch();
        translate([239, row4, 0]) HoleFor12VLightButton();
    }
}

splitA = 185;
splitB = 195;

module FrontRightSide()
{
    difference()
    {
        PowerSupplyFrontPanel();
        translate([-1, -1, -1]) cube([splitA, facePlateWidth + 2, facePlateThickness_2 + 2]);
        translate([-1, -1, -1]) cube([splitB, facePlateWidth + 2, facePlateThickness_2]);
    }
}

module FrontLeftSide()
{
    difference()
    {
        PowerSupplyFrontPanel();
        translate([splitB - 1, -1, -1]) cube([facePlateLength - splitA, facePlateWidth + 2, facePlateThickness_2 + 2]);
        translate([splitA - 1, -1, +1]) cube([facePlateLength - splitB, facePlateWidth + 2, facePlateThickness_2]);
    }
}

//translate([0, 0, 0.1])
//color("red") FrontRightSide();

//PowerSupplyFrontPanel(); // Whole piece

//translate([0, -0, -0.1])
//color("green") FrontLeftSide();





module HoleForBackOfATXPowerSupply()
{
    fn = 64;
    height = 6;
    screwRadius = 2;
    longBetweenScrews = 112.8;
    shortBetweenScrews = 51.6;

    translate([0,                 0,                  0]) cylinder(r = screwRadius, h = height, $fn = fn);
    translate([0,                 shortBetweenScrews, 0]) cylinder(r = screwRadius, h = height, $fn = fn);
    translate([longBetweenScrews, 0,                  0]) cylinder(r = screwRadius, h = height, $fn = fn);
    translate([longBetweenScrews, shortBetweenScrews, 0]) cylinder(r = screwRadius, h = height, $fn = fn);

    translate([ longBetweenScrews / 2, shortBetweenScrews / 2, height / 2])
    roundedBox([longBetweenScrews - 5, shortBetweenScrews - 5, height], 10, true, $fn = fn);
}

module PowerSupplyBackPanel()
{
    difference()
    {
         CompletePanel();

         translate([130, 10, -1])
         HoleForBackOfATXPowerSupply();
    }
}

//difference()
//{
    PowerSupplyBackPanel();
//    translate([0, -100, -1]) cube([facePlateLength - 50, 400, 5]);
//    translate([0,  30, -1]) cube([facePlateLength, 400, 5]);
//}
