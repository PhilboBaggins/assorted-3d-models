
DEFAULT_FONT = "Roboto";
//DEFAULT_FONT = "Helvetica";

DEFAULT_TEXT_COASTER_SIZE = [70, 70, 3];

module centeredText(text, area, resizeTextHeight, font)
{
    length = area[0];
    height = area[1];
    depth  = area[2];

    translate([(length / -2), 0, (depth / -2)])
    linear_extrude(depth)
    resize([length, resizeTextHeight ? height : 0], auto = true)
    text(text, font, valign = "center");
}

module TextCoaster(text,
    boxSize=DEFAULT_TEXT_COASTER_SIZE,
    font=DEFAULT_FONT,
    resizeTextHeight=true)
{
    MARGIN_WIDTH = boxSize[2] / 2;

    MARGIN_DEPTH = boxSize[2] / 2;
    TEXT_DEPTH = boxSize[2] / 2;

    translate([0, 0, boxSize[2] / 2])
    difference()
    {
        // Main shape
        cube(boxSize, center=true);

        // Margins
        difference()
        {
            translate([0, 0, boxSize[2] - MARGIN_DEPTH])
            cube(boxSize - [MARGIN_WIDTH*2, MARGIN_WIDTH*2, 0], center=true);

            cube(boxSize - [MARGIN_WIDTH*4, MARGIN_WIDTH*4, 0], center=true);
        }

        // Text
        textArea = boxSize - [MARGIN_WIDTH*6, MARGIN_WIDTH*6, 0];
        translate([0, 0,  boxSize[2] - TEXT_DEPTH])
        centeredText(text, textArea, resizeTextHeight, font);
    }
}

module TextCoasterArray(textArray)
{
    for (idx = [0 : 1 : len(textArray) - 1])
    {
        text = textArray[idx];
        xOffsef = (5 + DEFAULT_TEXT_COASTER_SIZE[0]) * idx;
        yOffset = DEFAULT_TEXT_COASTER_SIZE[1] + 5;

        translate([xOffsef, 0, 0])
        TextCoaster(text);

        translate([xOffsef, yOffset, 0])
        TextCoaster(text, resizeTextHeight=false);
    }
}

TextCoasterArray([
    "#!",
    "A",
    "ABCD",
    "ABCDE",
]);
