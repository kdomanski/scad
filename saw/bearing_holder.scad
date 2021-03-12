include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

l = 95;
h = 3;

difference() {
    fwd(l/2) cuboid([17, l, h], chamfer=0.5);
    fwd(4) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
    fwd(4+21) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
    fwd(4+21+21) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
    fwd(4+21+21+21) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
    fwd(4+21+21+21+8) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
    fwd(4+21+21+21+8+16) cyl(h=h+0.01, d=3.1, chamfer=-0.3, center=true, $fn=120);
}
