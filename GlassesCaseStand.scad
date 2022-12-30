module GlassesCaseStand(caseWidth = 70, standWidth = 20, thickness = 2, hookBack = 20)
{
    cube([caseWidth * 1.5 + thickness, standWidth,thickness]);

    rotate([0, 0, 90])
    translate([0, -caseWidth, 0])
    cube([standWidth, thickness, caseWidth]);

    cube([thickness, standWidth, hookBack]);

    translate([thickness, 0, hookBack - thickness])
    cube([hookBack * 2 / 5, standWidth, thickness]);

    translate([caseWidth - hookBack, 0, caseWidth])
    cube([hookBack, standWidth, thickness]);

    translate([caseWidth - hookBack, 0, caseWidth - hookBack * 2 / 5])
    cube([thickness, standWidth, hookBack * 2 / 5]);
}

GlassesCaseStand(standWidth = 2);
