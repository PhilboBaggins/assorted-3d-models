/*
 * Holder for a small push button like this one https://www.sparkfun.com/products/11992
 */

module TriggerSwitchHolder(height = 65, radius = 12.5, innerHeight = 23, innerRadius = 12.5/2)
{
    difference()
    {
        cylinder(h = height, r = radius, center = true);

        translate([0, 0, (height - innerHeight) / 2 ])
        cylinder(h = innerHeight, r = innerRadius, center = true);
    }
}

TriggerSwitchHolder();
