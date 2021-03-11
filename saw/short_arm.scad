include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

length = 60;
width = 20;
thickness = 4;
hole_d = 6;
keyhole_width = 10;
keyhole_ring_d=width+4;

module nut_outline(d, h) {
    for (rot = [0:60:300]) {
        rotate([0, 0, rot])
            cuboid([(d/2 + 0.1)*2/sqrt(3), (d/2)+0.1, h+0.1], anchor=BACK);
    }
}

module short_arm_body() {
    difference() {
        union() {
            cuboid([length, width, thickness], chamfer=0.6);
            left(length/2) cyl(h=thickness, d=width, chamfer=0.6, center=true, $fn=120);
            up(5-(thickness/2)) right(length/2) cyl(h=10, d=keyhole_ring_d, chamfer=0.6, center=true, $fn=120);
        }
        up(5-(thickness/2)) {
            right(length/2) cyl(h=10+0.1, d=keyhole_width, chamfer=-0.6, center=true, $fn=120);
            right((length/2)+(keyhole_width/2)) xrot(90) yrot(90) nut_outline(8, 9);
            right((length/2)+(keyhole_ring_d/4)) yrot(90) cyl(h=keyhole_ring_d/2, d=5, chamfer=-0.4, $fn=120);
        }
    }
}

difference() {
    short_arm_body();
    for ( i = [-length/2 : hole_d*1.5 : (length/2)-(keyhole_ring_d/2)-(hole_d/2)-1] ) {
        right(i) cyl(h=thickness+0.1, d=hole_d, chamfer=-0.6, center=true, $fn=120);
    }
}