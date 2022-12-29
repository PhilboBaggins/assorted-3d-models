module CubieBox(length=20, width=20, height=20, numRows=6, numCols=4, wallThickness=2)
{
    overallLength = (wallThickness + length) * numRows + wallThickness;
    overallWidth  = (wallThickness + width) * numCols + wallThickness;
    overallHeight = height * numRows / 4;

    difference()
    {
        // Overall box shape
        cube([overallLength, overallWidth, overallHeight]);

        // Cut outs for each storage hole
        for (row = [0 : 1 : numRows - 1])
        {
            for (column = [0 : 1 : numCols - 1])
            {
                color(rands(0, 1.0, 3))
                translate([wallThickness + (length + wallThickness) * row,
                           wallThickness + (width + wallThickness) * column,
                           wallThickness + numRows * (numRows - row) / 4])
                cube(length, width, height);
            }
        }

        // Cut diagonally off the top
        translate([-5,  -5,  overallHeight])
        rotate([0, 6, 0])
        cube([overallLength + 10, overallWidth + 10, overallHeight]);
    }
}

CubieBox();
