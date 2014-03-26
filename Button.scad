/*
 * Insipred by [MakerBot Curriculum OpenScad tutorial](http://curriculum.makerbot.com/2011/openscad_intro.html)
 *
 * Also, I needed a new button for by pants.
 */

$fn=100;

button(15,5);

module button(radius, height)
{
    intersection()
    {
        difference()
        {
            difference()
            {
                cylinder(h = height, r = radius);
                translate([ radius/5,  radius/5, -1]) cylinder(h = height+2, r = radius/10);
                translate([ radius/5, -radius/5, -1]) cylinder(h = height+2, r = radius/10);
                translate([-radius/5,  radius/5, -1]) cylinder(h = height+2, r = radius/10);
                translate([-radius/5, -radius/5, -1]) cylinder(h = height+2, r = radius/10);
            }
            translate([0, 0, radius+1]) sphere(r = radius);
        }
        sphere(r = radius - radius/4);
    }
}
