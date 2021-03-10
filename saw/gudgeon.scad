include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module nut_outline(d, h) {
    for (rot = [0:60:300]) {
        rotate([0, 0, rot])
            cuboid([(d/2 + 0.1)*2/sqrt(3), (d/2)+0.1, h+0.1], anchor=BACK);
    }
}

width = 22;
height = 36;
thickness = 14;
difference() {
    cuboid([width, height, thickness], rounding=7,  edges=[TOP+BACK, BOTTOM+BACK, FRONT+LEFT, FRONT+RIGHT], anchor=BACK, $fn=120);
    fwd(6) cyl(d=6.10, h = width+0.01, spin=[0, 90, 0], chamfer=-0.5, $fn=120);
    fwd(21.5) cyl(d=16.10, h=thickness+0.01, chamfer=-0.5, $fn=120);
    fwd(21.5+8) xrot(90) nut_outline(d=8, h=9);
    fwd(21.5+8) xrot(90) cyl(d=5, h=13.01, chamfer=-0.3, $fn=120);
}