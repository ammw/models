difference() {
    union() {
        cylinder(h=2.001, r=15);
        translate([0,0,2])
            cylinder(h=42.001, r=5.5);
        translate([0,0,44])
            cylinder(h=14.001, r=2.5);
        translate([0,0,21])
            cube([36,2,38], center=true);
        translate([0,0,21])
            rotate([0,0,90])
                cube([36,2,38], center=true);
        difference() {
            translate([-3,0,0])
                rotate([0,90,0])
                    translate([-63,0,0])
                        cylinder(h=6, r=6.001);
            translate([-4,0,0])
                rotate([0,90,0])
                    translate([-63,0,0])
                        cylinder(h=8, r=3.75);
        }
        translate([0,0,68.5])
            cylinder(h=3.001,r=7);
    };
    translate([0,0,-0.002])
        cylinder(h=20, r=4);
}
