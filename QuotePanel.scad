
DEFAULT_FONT = "Roboto";
//DEFAULT_FONT = "Helvetica";

DEFAULT_QUOTE_SHEEET_SIZE = [400, 50, 3];

module centeredText(text, area, resizeTextHeight, font)
{
    length = area[0];
    height = area[1];
    depth  = area[2];

    translate([(length / -2), 0, (depth / -2)])
    linear_extrude(depth)
    resize([length, resizeTextHeight ? height : 0], auto = true)
    text(text, font=font, valign = "center");
}

module QuotePanel(
    quoteText,
    sourceText,
    boxSize = DEFAULT_QUOTE_SHEEET_SIZE, 
    resizeTextHeight=false,
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

            // Quote text
            quoteTextArea = boxSize - [MARGIN_WIDTH*6, MARGIN_WIDTH*6, 0];
            translate([0, 0,  boxSize[2] - TEXT_DEPTH])
            centeredText(quoteText, quoteTextArea, resizeTextHeight, font);

            // Source text
            //sourceTextArea = [boxSize[0]/10,  boxSize[1]/10, boxSize[2]];
            //color("red")
            //translate([boxSize[0] * 0.425, boxSize[1] * -0.3,  boxSize[2] - TEXT_DEPTH])
            //centeredText(sourceText, sourceTextArea, resizeTextHeight, font);
        }
    }
}

QuotePanel("If you want the toilet, you're in it", " - TISM");
