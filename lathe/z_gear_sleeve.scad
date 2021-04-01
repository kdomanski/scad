include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

module nut_outline(d, h) {
    for (rot = [0:60:300]) {
        rotate([0, 0, rot])
            cuboid([(d/2 + 0.2)*2/sqrt(3), (d/2)+0.2, h+0.2], anchor=BACK);
    }
    cuboid([(d+0.4)*2/sqrt(3), 2*d, h+0.2], anchor=BACK);
}

difference() {
    union() {
        cyl(h=12, d=20, chamfer=0.5, $fn=360);
        up(5) cyl(h=2, d=25, chamfer=0.5, $fn=120);
    }
    cyl(h=12.01, d=5, chamfer=-0.5, $fn=360);
    
    fwd(2.5) down(1) xrot(90) {
        zrot(180) nut_outline(5.6, 3);
        up(4.0) cyl(d=3.1, h=7, chamfer=-0.4, center=true, $fn=120);
    }
}

down(0) right(10) cuboid([3, 4, 12], chamfer=0.5);