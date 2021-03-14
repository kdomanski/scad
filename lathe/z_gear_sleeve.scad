include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module nut_outline(d, h) {
    for (rot = [0:60:300]) {
        rotate([0, 0, rot])
            cuboid([(d/2 + 0.1)*2/sqrt(3), (d/2)+0.1, h+0.1], anchor=BACK);
    }
}

difference() {
    union() {
        cyl(h=20, d=20, chamfer=0.5, $fn=360);
        up(5) cyl(h=10, d=25, chamfer=0.5, $fn=120);
    }
    up(5) cyl(h=10.01, d=10, chamfer=-0.5, $fn=120);
    down(5) cyl(h=10.01, d=5, chamfer=-0.5, $fn=360);
    
    fwd(5) up(5) xrot(90) {
        nut_outline(8, 9);
        up(5) cyl(d=5, h=5, chamfer=-0.4, center=true, $fn=120);
    }
}

down(4) right(10) cuboid([3, 4, 12], chamfer=0.5);
