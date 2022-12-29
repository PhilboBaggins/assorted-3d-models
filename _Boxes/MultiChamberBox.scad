module MultiChamberBox(size=[150, 100, 20], wall=0.25, numXBoxes=5, numYBoxes=3)
{
    holeSize = [(size[0] / numXBoxes) - (wall * numXBoxes),
                (size[1] / numYBoxes) - (wall * numXBoxes),
                 size[2]];

    difference()
    {
        cube(size);

        for (x = [0 : numXBoxes - 1])
        {
            for (y = [0 : numYBoxes - 1])
            {
                color(rands(0, 1.0, 3))
                translate([wall*(numXBoxes - x - 1) + size[0] / numXBoxes * x,
                           wall*(numYBoxes - y - 1) + size[1] / numYBoxes * y,
                           wall])
                cube(holeSize);
            }
        }
    }
}

MultiChamberBox();
