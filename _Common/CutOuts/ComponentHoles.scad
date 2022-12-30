module HoleForSquarePushButton(height=40)
{
    cube([12.7, 10.88, height], center=true);
}

// This is **probably** [this](https://dx.com/p/3-pin-slide-switch-diy-parts-red-10-piece-pack-118187)
module HoleForSmallRectangularSlideSwitch(height=40)
{
    cube([6.66, 12.65, height], center=true);
}

module HoleForSmallerRectangularSlideSwitch(height=40)
{
    cube([5.7, 12.24, height], center=true);
}

module HoleForVerySmallRectangularSlideSwitchWithScrewHoles(height=40)
{
    cube([5.7, 10.55, height], center=true);
}

module HoleForPotentiometer(height=40, fn=64)
{
    cylinder(h=height, r=6.77/2, center=true, $fn=fn);
}

module HoleForCylinderToggleButton(height=23, fn=64)
{
    cylinder(h=height, r=11.5/2, center=true, $fn=fn);
}

// Should rename to rocker switch - Like this one http://littlebirdelectronics.com/products/rocker-switch-spst-round
module HoleForRoundBigRedToggleSwitch(height=40, fn=64)
{
    cylinder(h=height, r=20.5/2, center=true, $fn=fn);
}

// Slide Potentiometer - Like this one http://littlebirdelectronics.com/products/slide-potentiometer-10k
module HoleForSlidePotentiometer(height=40)
{
    cube([1.5, 67.2, height], center=true);
}

module HoleForSmallSilverMissileSwitch(height=40, fn=64)
{
    cylinder(h=height, r=6/2, center=true, $fn=fn);
}

module HoleFor5mmDiffusedLED(height=40, fn=64)
{
    cylinder(h=height, r=5/2, center=true, $fn=fn);
}

module HoleFor3mmLED(height=40, fn=64)
{
    cylinder(h=height, r=3/2, center=true, $fn=fn);
}

module HoleForPlugable2PinScrewTerminal(height=40)
{
    cube([7, 8.1, height], center=true);
}

module HoleForPlugable10PinOrangeTerminal(height=40)
{
    cube([18.78, 10.47, height], center=true);
}

module HoleForUSBTypeAFemale(height=40)
{
    cube([13.24, 5.8, height], center=true);
}

module HoleForSmallDXVoltMeter(height=40, fn=64)
{
    screwDistance = 26.5 / 2;

    cube([22.62, 14.08, height], center=true);
    translate([-screwDistance, 0, 0]) cylinder(height, 1, 1, center=true, $fn=fn);
    translate([ screwDistance, 0, 0]) cylinder(height, 1, 1, center=true, $fn=fn);
}

module HoleForBananaPlug(height=40, fn=64)
{
    cylinder(h=height, r=7.2/2, center=true, $fn=fn);
}

module HoleFor12VLightButton(height=40, fn=64)
{
    cylinder(h=height, r=16/2, center=true, $fn=fn);
}

// http://www.digikey.com.au/product-detail/en/1899155/277-6689-ND/2525269
module HoleFor4PinPanelMountScrewTerm(height=40, fn=64)
{
    numPos = 4;
    b = 2.38 + (numPos * 5.08);
    c = b + 7.22;

    cube([b, 10.4, height], center=true);
    translate([-c/2, 0, 0]) cylinder(h=height, r=3.2/2, center=true, $fn=fn);
    translate([ c/2, 0, 0]) cylinder(h=height, r=3.2/2, center=true, $fn=fn);
}
