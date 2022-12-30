DEFAULT_THICKNESS = 2;

module MonitorHook(length, thickness, monitorWidth = 18, lipHeight = 13)
{
	translate([0, monitorWidth/2, 0])
	cube([length, monitorWidth, thickness], center = true);

	translate([0, monitorWidth, (thickness-lipHeight)/2])
	cube([length, thickness, lipHeight], center = true);
}

module BackOfMonitorBox(length, width, depth, thickness)
{
	difference()
	{
		cube([length, width, depth], center = true);

		translate([0, 0, thickness*2])
		cube([length-thickness*2, width-thickness*2, depth-thickness*2], center = true);
	}

	translate([-length/3, width/2, depth*2/5])
	MonitorHook(length = length/7, thickness = thickness);

	translate([length/3, width/2, depth*2/5])
	MonitorHook(length = length/7, thickness = thickness);
}



module PencilBox(length = 100, width = 50, depth = 145*4/7, thickness = DEFAULT_THICKNESS)
{
    BackOfMonitorBox(length = length, width = width, depth = depth, thickness = thickness);
}

module CottonBudHolder(length = 40, width = 20, depth = 47, thickness = DEFAULT_THICKNESS)
{
    BackOfMonitorBox(length = length, width = width, depth = depth, thickness = thickness);
}



PencilBox();

translate([150, 0, 0])
CottonBudHolder();
