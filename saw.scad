include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

module short_arm_keyhole(d, thickness, keyhole_width, keyhole_depth) {
    difference() {
        cyl(h=thickness+0.1, d=d, chamfer=-0.6, center=true, $fn=120);
        back(((d-keyhole_depth)/2)+0.5)
            cube([keyhole_width, keyhole_depth+1, thickness+0.1], center=true);
    }
}

module short_arm_body(length, width, thickness, hole) {
    cuboid([length, width, thickness], chamfer=0.6);
    left(length/2) cyl(h=thickness, d=width, chamfer=0.6, center=true);
    right(length/2) cyl(h=thickness, d=width, chamfer=0.6, center=true);
}

module short_arm(length, width, thickness, hole, keyhole) {
    difference() {
        short_arm_body(length, width, thickness, hole);
        {
            left(length/2) cyl(h=thickness+0.1, d=hole, chamfer=-0.6, center=true, $fn=120);
            right(length/2) short_arm_keyhole(d=keyhole, thickness=thickness, keyhole_width=3, keyhole_depth=1.5);
        }
    }
}

short_arm(60, 20, 4, hole=6, keyhole=10);