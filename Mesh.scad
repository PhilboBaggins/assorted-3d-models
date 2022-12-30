use <_Common/3rdParty/MCAD/shapes.scad>

module Mesh(numX = 5, numY = 3, hexagonSize = 5, height = 0.5, thickness = 0.5)
{
    for ( x = [0 : numX] )
    {
        for ( y = [0 : numY] )
        {
            difference()
            {
                translate([x * hexagonSize, y * hexagonSize, 0])
                hexagon(hexagonSize, height);

                translate([x * hexagonSize, y * hexagonSize, 0])
                hexagon(hexagonSize - thickness, height + thickness*2);
            }
        }
    }
}

Mesh();
