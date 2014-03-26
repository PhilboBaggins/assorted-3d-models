$fn=96;

// This one leaves a vertical rim
module MainShape(height, baseRadius, topRadius, thickness)
{
    hull()
    {
        // Base
        cylinder(thickness, baseRadius, baseRadius);

        // Top
        translate([0, 0, height])
        cylinder(thickness, topRadius, topRadius);
    }
}

// This one leaves a horizontal rim
module MainShape2(height, baseRadius, topRadius, thickness)
{
    cylinder(height, baseRadius, topRadius);
}

module Bowl(height=50, baseRadius=50, topRadius=150, thickness=1)
{
    difference()
    {
        MainShape(height, baseRadius, topRadius, thickness);

        translate([0, 0, thickness])        
        MainShape(height, baseRadius, topRadius, thickness);
    }
}

Bowl();
