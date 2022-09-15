// remember that everything is in milimeters

$fa = 1;
$fs = 0.4;

delta = 0.001;
side_length = 38;
side_width = 2;
max_width = 36;
top_width = 2;

module hook(rotation) {
    offset_x = max_width/2 - 3;
    offset_z = side_length+4;
    rotate([0,0,rotation])
        translate([offset_x,0,offset_z+0.3])
            rotate([0,18,0])
                cube([4,side_width,6], center=true);
    rotate([0,0,rotation])
        translate([max_width/2-2,0,offset_z])
            cube([4,side_width,5], center=true);
}

module side(rotation) {
    offset = top_width + side_length/2;
    translate([0,0,offset])
            rotate([0,0,rotation])
                cube([max_width,side_width,side_length], center=true);
    hook(rotation);
    hook(rotation + 180);
}

module ring() {
    difference() {
        // ring
        translate([-3,0,0])
            rotate([0,90,0])
                translate([-63,0,0])
                    cylinder(h=6, r=6+delta);
        // hole
        translate([-4,0,0])
            rotate([0,90,0])
                translate([-63,0,0])
                    cylinder(h=8, r=3.75);
    }
    // final disk
    translate([0,0,68.5])
        cylinder(h=3+delta,r=7);
}

module core() {
    cylinder(h=top_width+delta, r=15);
    core_length = side_length+4;
    translate([0,0,top_width])
        cylinder(h=core_length+delta, r=5.5);
    stem_length = 14;
    translate([0,0,core_length+top_width])
        cylinder(h=stem_length+delta, r=2.5);
}

difference() {
    union() {
        core();
        side(0);
        side(90);
    };
    // the hole on the top
    translate([0,0,-2*delta])
        cylinder(h=22, r=4);
}
ring();