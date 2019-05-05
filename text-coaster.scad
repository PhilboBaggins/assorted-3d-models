
DEFAULT_FONT = "Roboto";
//DEFAULT_FONT = "Helvetica";

DEFAULT_TEXT_COASTER_SIZE = [70, 70, 3];
DEFAULT_TEXT_SIZE = 55;

module centeredText(text, height, textSize, font)
{
    translate([(textSize / -2), (textSize / -2), (height / -2)])
    linear_extrude(height)
    text(text, textSize, font, "center", "center");
}

module TextCoaster(text,
    textSize=DEFAULT_TEXT_SIZE,
    boxSize=DEFAULT_TEXT_COASTER_SIZE,
    font=DEFAULT_FONT)
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
        translate([0, 0,  boxSize[2] - TEXT_DEPTH])
        centeredText(text, boxSize[2], textSize, font);
    }
}

translate([ 0, 0, 0]) TextCoaster("#!");
translate([75, 0, 0]) TextCoaster("A");
