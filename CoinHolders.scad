EXTRA_SPACE = 1;
WALL_THICKNESS = 1;

10_C_HEIGHT = 1.82;
10_C_RADIUS = 23.17 / 2;

20_C_HEIGHT = 2.33;
20_C_RADIUS = 28.41 / 2;

50_C_HEIGHT = 2.57;
50_C_RADIUS = (31.58 + 3) / 2;

01_D_HEIGHT = 2.64;
01_D_RADIUS = 24.89 / 2;

02_D_HEIGHT = 2.8;
02_D_RADIUS = 20.39 / 2;

module BaseHolder(numCoins, height, radius)
{
    difference()
    {
        cylinder(r = (radius + EXTRA_SPACE + WALL_THICKNESS), h = (numCoins * height));

        translate([0, 0, WALL_THICKNESS])
        cylinder(r = (radius + EXTRA_SPACE), h = (numCoins * height + WALL_THICKNESS));
    }
}

module 10_C_Holder(numCoins = 10 * 10 + 3)
{
    BaseHolder(numCoins, 10_C_HEIGHT, 10_C_RADIUS);
}

module 20_C_Holder(numCoins = 5 * 10 + 3)
{
    BaseHolder(numCoins, 20_C_HEIGHT, 20_C_RADIUS);
}

module 50_C_Holder(numCoins = 2 * 10 + 2)
{
    BaseHolder(numCoins, 50_C_HEIGHT, 50_C_RADIUS);
}

module 01_D_Holder(numCoins = 1 * 20 + 2)
{
    BaseHolder(numCoins, 01_D_HEIGHT, 01_D_RADIUS);
}

module 02_D_Holder(numCoins = 50 / 2 + 2)
{
    BaseHolder(numCoins, 02_D_HEIGHT, 02_D_RADIUS);
}

offset1 = 0;
offset2 = offset1 + (WALL_THICKNESS + EXTRA_SPACE) * 2 + 10_C_RADIUS + 20_C_RADIUS - 0.1;
offset3 = offset2 + (WALL_THICKNESS + EXTRA_SPACE) * 2 + 20_C_RADIUS + 50_C_RADIUS - 0.1;
offset4 = offset3 + (WALL_THICKNESS + EXTRA_SPACE) * 2 + 50_C_RADIUS + 01_D_RADIUS - 0.1;
offset5 = offset4 + (WALL_THICKNESS + EXTRA_SPACE) * 2 + 01_D_RADIUS + 02_D_RADIUS - 0.1;

translate([offset1, 0, 0]) 10_C_Holder();
translate([offset2, 0, 0]) 20_C_Holder();
translate([offset3, 0, 0]) 50_C_Holder();
translate([offset4, 0, 0]) 01_D_Holder();
translate([offset5, 0, 0]) 02_D_Holder();
