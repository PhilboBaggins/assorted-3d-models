


// Similar to https://www.shapeways.com/product/ZARSK2E3H/pi-pen-holder-small?optionId=4677896&li=marketplace



DEFAULT_WIDTH = 5;

//DEFAULT_FONT = "Roboto";
DEFAULT_FONT = "Helvetica";

module 3DCharacter(char, font=DEFAULT_FONT, width=DEFAULT_WIDTH)
{
    rotate([90, 0, 0])
    translate([0, 0, -width/2])
    linear_extrude(width)
    text(char, halign = "center");
}

module 3DTextCircle(radius, msg, font=DEFAULT_FONT, width=DEFAULT_WIDTH)
{
    stepDegrees = 360 / len(msg);

    for (idx = [0 : 1 : len(msg) - 1])
    {
        a = stepDegrees * idx;
        x = radius * cos(a);
        y = radius * sin(a);
        
        translate([x, y, 0])
        rotate([0, 0, 90 + a])
        3DCharacter(msg[idx], width);
    }
}

translate([0,  0, 0]) 3DTextCircle( 7, "ABCDEF");
translate([40, 0, 0]) 3DTextCircle(15, "HELLOWORLD");
