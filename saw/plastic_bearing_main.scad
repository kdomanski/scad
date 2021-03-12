include <../BOSL2/std.scad>
include <../BOSL2/shapes.scad>

l = 34.6;
l_shoulder = 4;

difference() {
    union() {
        cyl(h = l+l_shoulder, d=10, chamfer=1, $fn = 120);
        down(l/2) cyl(h = l_shoulder, d=12, chamfer1=1, chamfer2=0.2, $fn = 120);
    }
    cyl(h = l+l_shoulder+0.01, d=6, chamfer=-0.3, $fn = 120);
    for (i = [0 : 12 : 359]) {
        zrot(i) right(3) cube([2, 0.5, l+l_shoulder+0.01], center=true);
    }
}
