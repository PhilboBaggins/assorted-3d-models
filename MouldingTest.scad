
$fn = 32;

cornerRadius = 5;
outerSize = [100, 50, 20];
innerSize = outerSize / 10 * 9;

function CenteredTop(outerSize, innerSize) = [
    (outerSize[0] - innerSize[0]) / 2,
    (outerSize[1] - innerSize[1]) / 2,
    outerSize[2] / 10 * 1];

function CenteredBottom(outerSize, innerSize) = [
    (outerSize[0] - innerSize[0]) / 2,
    (outerSize[1] - innerSize[1]) / 2,
    0];

module RoundedCornerBox(size, cornerRadius)
{
    x1 =           cornerRadius;
    x2 = size[0] - cornerRadius;
    y1 =           cornerRadius;
    y2 = size[1] - cornerRadius;

    linear_extrude(size[2])
    hull()
    {
        translate([x1, y1]) circle(r=cornerRadius);
        translate([x2, y1]) circle(r=cornerRadius);
        translate([x1, y2]) circle(r=cornerRadius);
        translate([x2, y2]) circle(r=cornerRadius);
    }
}

module DropTray()
{
    offset = CenteredTop(outerSize, innerSize);

    difference()
    {
        RoundedCornerBox(outerSize, cornerRadius);

        translate(offset)
        RoundedCornerBox(innerSize, cornerRadius);
    }
}

module Mould()
{
    boxSize = outerSize * 1.1;
    offset = CenteredBottom(boxSize, outerSize);

    difference()
    {
        cube(boxSize);

        translate(offset)
        DropTray();
    }
}

//DropTray();
Mould();
