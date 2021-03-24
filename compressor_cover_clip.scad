include <BOSL2/std.scad>
include <BOSL2/shapes.scad>

rod_d=13;
rod_dist=28;

difference() {
    cuboid([62, 13, 16], rounding=4, $fn=240);
    fwd(rod_d/2) {
        left((rod_d+rod_dist)/2) cyl(h=16.001, d=rod_d, chamfer=-0.5, $fn=240);
        right((rod_d+rod_dist)/2) cyl(h=16.001, d=rod_d, chamfer=-0.5, $fn=240);
    }

    xrot(90) {
        left(7.5) cyl(h=13.001, d=3.6, chamfer=-0.5, $fn=240);
        right(7.5) cyl(h=13.01, d=3.6, chamfer=-0.5, $fn=240);
    }
}
